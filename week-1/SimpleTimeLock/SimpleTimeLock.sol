// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleTimeLock {
    // === Errors ===
    error NotFutureUnlockTime(); 
    error NoEtherToWithdraw(); 
    error EtherStillLocked();
    error InvalidDepositIndex();
    error ZeroEther();
    error InsufficientAmount(); 
    error LockAlreadyCanceled(); 

    // === State Vars ===
    struct Lock {
        uint256 amount; // amount of ether locked
        uint256 unlockTime; // time when ether can be withdrawn
        string name; // name of the lock for user identification
        bool isCanceled; // flag to indicate if lock is canceled
    }

    mapping(address => Lock[]) public locks; // mapping to track user locks

    // === Events ===
    event EtherLocked(address indexed user, uint256 amount, uint256 unlockTime, string name);
    event EtherWithdrawn(address indexed user, uint256 amount);
    event LockCanceledEvent(address indexed user, uint256 amount, string name); // renamed event for lock cancellation
    event LockExpiringSoon(address indexed user, uint256 unlockTime, string name); // event for expiring locks

    // === Call Function ===
    function lockEther(uint256 _lockDuration, string calldata _name) external payable {
        if (msg.value <= 0) revert ZeroEther();
        if (_lockDuration <= 0) revert NotFutureUnlockTime(); 

        uint256 unlockTime = block.timestamp + _lockDuration; // unlock time
        // update the user's lock
        locks[msg.sender].push(Lock({
            amount: msg.value,
            unlockTime: unlockTime,
            name: _name,
            isCanceled: false
        }));

        emit EtherLocked(msg.sender, msg.value, unlockTime, _name);
    }

    function withdrawEther(uint256 _index, uint256 _amount) external {
        if (_index >= locks[msg.sender].length) revert InvalidDepositIndex(); 
        Lock storage userLock = locks[msg.sender][_index];
        if (userLock.isCanceled) revert LockAlreadyCanceled(); // check if the lock is canceled
        if (userLock.amount == 0) revert NoEtherToWithdraw();
        if (block.timestamp < userLock.unlockTime) revert EtherStillLocked(); 
        if (_amount > userLock.amount) revert InsufficientAmount(); // check if requested amount is valid

        userLock.amount -= _amount; // decrease user's lock amount
        payable(msg.sender).transfer(_amount); // transfer specified amount

        emit EtherWithdrawn(msg.sender, _amount); // emit event with remaining amount
    }

    function cancelLock(uint256 _index) external {
        if (_index >= locks[msg.sender].length) revert InvalidDepositIndex(); 
        Lock storage userLock = locks[msg.sender][_index];
        if (userLock.isCanceled) revert LockAlreadyCanceled(); // check if already canceled

        userLock.isCanceled = true; // mark lock as canceled
        uint256 amountToRefund = userLock.amount; // refund entire amount
        userLock.amount = 0; // reset user's lock amount

        payable(msg.sender).transfer(amountToRefund); // refund amount

        emit LockCanceledEvent(msg.sender, amountToRefund, userLock.name); // emit event for cancel
    }

    // === View Function ===
    function getUserLocks() external view returns (Lock[] memory) {
        return locks[msg.sender];
    }

    // === Receive Function ===
    receive() external payable {}

    // === Check Expiring Locks ===
    function checkExpiringLocks() external {
        for (uint256 i = 0; i < locks[msg.sender].length; i++) {
            Lock storage userLock = locks[msg.sender][i];
            if (!userLock.isCanceled && userLock.unlockTime <= block.timestamp + 1 days) {
                emit LockExpiringSoon(msg.sender, userLock.unlockTime, userLock.name);
            }
        }
    }

    // tnx: https://sepolia.etherscan.io/address/0x11243113117fa527e73b8d3a763c112027c28219
}