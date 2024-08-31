// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract ContributionCounter {
    mapping(address => uint256) public userToAmount; // mapping user address with amount contributed
    uint256 public totalContributor;
    address public owner;

    event Contributed(address indexed sender, uint256 amount);
    event Withdrawn(address indexed destination, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function contribute() public payable {
        require(msg.value > 0, "Ether amount must be greater than 0");
        require(userToAmount[msg.sender] == 0, "You have already contributed");
        userToAmount[msg.sender] = msg.value;
        totalContributor += 1;
        emit Contributed(msg.sender, msg.value);
    }

    function withdraw(
        uint256 amount,
        address payable destination
    ) public onlyOwner {
        require(
            amount <= address(this).balance,
            "Insufficient contract balance"
        );
        destination.transfer(amount);
        emit Withdrawn(destination, amount);
    }
}
