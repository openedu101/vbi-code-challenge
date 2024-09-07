// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract TimeLock is ReentrancyGuard {
    struct Deposit {
        uint256 amount;
        uint256 redemptionDate;
        bool redeemed;
    }

    mapping(address => Deposit[]) public userLockup;
    uint256 public redemptionDate;

    constructor() payable {
        require(msg.value > 0, "Initial Ether required for deployment");
    }

    function deposit(uint256 _redemptionDate) external payable {
        require(msg.value > 0, "Deposit requires Ether.");
        require(
            block.timestamp < _redemptionDate,
            "Redemption date must be in the future."
        );
        userLockup[msg.sender].push(
            Deposit({
                amount: msg.value,
                redemptionDate: _redemptionDate,
                redeemed: false
            })
        );
    }

    function withdraw(uint256 _id) external nonReentrant {
        require(_id < userLockup[msg.sender].length, "Invalid deposit ID.");
        Deposit storage userDeposit = userLockup[msg.sender][_id];
        require(!userDeposit.redeemed, "Deposit already redeemed.");
        require(
            userDeposit.redemptionDate <= block.timestamp,
            "Redemption date not reached."
        );
        uint256 amount = userDeposit.amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed.");
        userDeposit.redeemed = true;
    }

    receive() external payable {}
}
