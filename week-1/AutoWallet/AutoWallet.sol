// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract AutoWallet {
    // === Errors ===
    error NotOwner();
    error InvalidRecipient(); 
    error ZeroEther(); 
    error NoEtherToWithdraw(); 
    error InvalidFee();

    // === State Vars ===
    address public owner; // owner's contract
    address payable public recipient; // address that will receive the transferred ether
    uint256 public feePercentage; // fee percentage (in basis points, e.g., 100 = 1%)

    // === Events ===
    event Deposited(address indexed sender, uint256 amount, uint256 fee);
    event Transferred(address indexed recipient, uint256 amount);
    event RecipientChanged(address indexed oldRecipient, address indexed newRecipient);
    event FeeChanged(uint256 oldFee, uint256 newFee); 

    // === Modifiers ===
    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner(); 
        _;
    }

    // === Constructor ===
    constructor(address payable _recipient, uint256 _initFeePercentage) {
        if (_recipient == address(0)) revert InvalidRecipient(); 
        if (_initFeePercentage > 10000) revert InvalidFee(); // not more than 100%
        owner = msg.sender; // set the contract creator as owner
        recipient = _recipient; // set the init recipient address
        feePercentage = _initFeePercentage; // set the init fee percentage
    }

    // === Receive Function ===
    receive() external payable {
        if (msg.value <= 0) revert ZeroEther();

        // calculate fee based on the current fee percentage
        uint256 fee = (msg.value * feePercentage) / 10000; // fee in basis points
        uint256 amountToTransfer = msg.value - fee;

        // transfer the amount to the recipient
        recipient.transfer(amountToTransfer);

        emit Deposited(msg.sender, msg.value, fee);
        emit Transferred(recipient, amountToTransfer);
    }

    // === Owner Call Functions ===
    function changeRecipient(address payable newRecipient) external onlyOwner {
        if (newRecipient == address(0)) revert InvalidRecipient(); 
        emit RecipientChanged(recipient, newRecipient);
        recipient = newRecipient; // update the recipient address
    }

    function changeFeePercentage(uint256 newFeePercentage) external onlyOwner {
        if (newFeePercentage > 10000) revert InvalidFee(); // not more than 100%
        uint256 oldFee = feePercentage;
        feePercentage = newFeePercentage; // update fee percentage
        emit FeeChanged(oldFee, newFeePercentage); // emit event for fee change
    }

    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        if (balance <= 0) revert NoEtherToWithdraw(); 
        payable(owner).transfer(balance); // transfer the contract balance to owner's contract
    }

    // tnx: https://sepolia.etherscan.io/address/0x4a03d175e48473d876595767c80476de3cd4313c
}