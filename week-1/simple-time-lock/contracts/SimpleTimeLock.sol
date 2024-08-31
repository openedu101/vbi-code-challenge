// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract SimpleTimeLock {
    // struct to store lock information
    struct LockInfo {
        uint256 amount;
        uint256 unlockTime;
    }
    mapping(address => LockInfo) public lockInfos; // mapping user address with lock information

    event Locked(address indexed sender, uint256 amount, uint256 unlockTime);
    event Unlocked(address indexed sender, uint256 amount);

    constructor() {}

    function lock(uint256 _unlockTime) public payable {
        require(msg.value > 0, "Ether amount must be greater than 0");
        require(
            _unlockTime > block.timestamp,
            "Unlock time must be greater than current time"
        );
        lockInfos[msg.sender] = LockInfo(msg.value, _unlockTime);
        emit Locked(msg.sender, msg.value, _unlockTime);
    }

    function unlock() public {
        LockInfo storage lockInfo = lockInfos[msg.sender];
        require(lockInfo.amount > 0, "No locked Ether");
        require(
            block.timestamp >= lockInfo.unlockTime,
            "Time lock not expired"
        );
        uint256 amount = lockInfo.amount;
        require(
            address(this).balance >= amount,
            "Insufficient contract balance"
        );
        payable(msg.sender).transfer(amount);
        emit Unlocked(msg.sender, amount);
        delete lockInfos[msg.sender];
    }
}
