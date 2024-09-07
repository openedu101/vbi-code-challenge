// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ContributionCounter {
    // === Errors ===
    error InsufficientContribution();
    error AlreadyContributed(); 
    error NotOwner(); 
    error InsufficientBalance(); 
    error ContributionLimitExceeded(); 
    error WithdrawalsNotAllowedYet();

    // === State Vars ===
    mapping(address => uint256) public userToAmount; 
    mapping(address => uint256) public contributionTimestamp; 
    uint256 public totalContributors;
    address public owner;
    uint256 public maxContribution; 
    uint256 public withdrawalLockTime; 

    // === Events ===
    event Contributed(address indexed sender, uint256 amount, uint256 totalAmount);
    event Withdrawn(address indexed contributor, uint256 amount);
    event MaxContributionUpdated(uint256 newMaxContribution);
    event WithdrawalLockTimeUpdated(uint256 newLockTime);

    // === Modifiers ===
    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner(); // ensure only owner can call public functions
        _;
    }

    // === Constructor ===
    constructor(uint256 _maxContribution, uint256 _withdrawalLockTime) {
        owner = msg.sender; // set contract creator as owner
        maxContribution = _maxContribution; // set maximum contribution limit
        withdrawalLockTime = _withdrawalLockTime; // set withdrawal lock time
    }

    // === Call Function ===
    function contribute() public payable {
        if (msg.value <= 0) revert InsufficientContribution(); // ensure contribution is greater than zero
        if (userToAmount[msg.sender] > 0) revert AlreadyContributed(); // ensure user has not contributed before
        if (msg.value > maxContribution) revert ContributionLimitExceeded(); // check against max contribution

        userToAmount[msg.sender] = msg.value; // update user's contribution amount
        contributionTimestamp[msg.sender] = block.timestamp; // record contribution time
        totalContributors++; // increment total contributors
        emit Contributed(msg.sender, msg.value, userToAmount[msg.sender]); // emit event for contribution
    }

    function withdraw(uint256 amount) public {
        if (amount > userToAmount[msg.sender]) revert InsufficientContribution(); // ensure user has enough balance to withdraw
        if (block.timestamp < contributionTimestamp[msg.sender] + withdrawalLockTime) revert WithdrawalsNotAllowedYet(); // check if withdrawals are allowed
        if (amount > address(this).balance) revert InsufficientBalance(); // ensure contract has enough balance

        userToAmount[msg.sender] -= amount; // decrease user's contribution amount
        payable(msg.sender).transfer(amount); // transfer specified amount to user
        emit Withdrawn(msg.sender, amount); // emit event for withdrawal
    }

    function updateMaxContribution(uint256 newMaxContribution) external onlyOwner {
        maxContribution = newMaxContribution; // update maximum contribution limit
        emit MaxContributionUpdated(newMaxContribution); // emit event for max contribution update
    }

    function updateWithdrawalLockTime(uint256 newLockTime) external onlyOwner {
        withdrawalLockTime = newLockTime; // update withdrawal lock time
        emit WithdrawalLockTimeUpdated(newLockTime); // emit event for withdrawal lock time update
    }

    // === View Function ===
    function getUserContribution() external view returns (uint256) {
        return userToAmount[msg.sender]; // return user's total contribution
    }

    function getTotalContributors() external view returns (uint256) {
        return totalContributors; // return total number of unique contributors
    }

    // tnx: https://sepolia.etherscan.io/address/0xf669885ad124e9a74182d7b995bdffc672d114e9
}