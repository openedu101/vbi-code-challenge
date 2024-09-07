// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contribution {
    mapping(address => uint256) public contributor;

    constructor() payable {}

    receive() external payable {
        require(contributor[msg.sender] == 0, "Address already contributed");
        require(msg.value > 0, "Contributing requires Ether.");
        contributor[msg.sender] = msg.value;
    }
}
