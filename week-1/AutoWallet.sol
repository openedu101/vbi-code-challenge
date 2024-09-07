// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AutoWallet {
    uint8 public rate;
    address payable public receiver;

    constructor(address payable _receiver, uint8 _rate) payable {
        require(msg.value > 0, "Initial Ether required for deployment");
        require(_receiver != address(0), "Receiver address invalid");
        require(_rate > 0 && _rate <= 100, "Rate must be between 1 and 100");

        receiver = _receiver;
        rate = _rate;
    }

    receive() external payable {
        uint256 transferAmount = (msg.value * rate) / 100;
        (bool success, ) = receiver.call{value: transferAmount}("");
        require(success, "Transfer failed");
    }
}
