// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AutoWallet {
    address public immutable owner; // save the address of the contract creator
    address public receiver; // save the address of the receiver
    uint16 public feePercent; // save the fee percent with the denominator is 10_000 (100%)
    uint16 public constant DENOMINATOR = 10_000; // the maximum fee percent is 100%

    event Deposited(address indexed sender, uint256 amount);
    event ReceiverChanged(
        address indexed oldReceiver,
        address indexed newReceiver
    );
    event FeePercentChanged(uint16 oldFeePercent, uint16 newFeePercent);
    event Withdrawn(address indexed destination, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor(address _receiver, uint16 _feePercent) {
        owner = msg.sender;
        setReceiver(_receiver);
        setFeePercent(_feePercent);
    }

    receive() external payable {
        // emit an event to log the deposit
        emit Deposited(msg.sender, msg.value);
        // calculate the amount after fee
        uint256 amount_minus_fee = (msg.value *
            uint256(DENOMINATOR - feePercent)) / DENOMINATOR;

        // keep the fee and send the rest to the receiver
        payable(receiver).transfer(amount_minus_fee);
    }

    function setReceiver(address _receiver) public onlyOwner {
        // check if the receiver address is valid
        require(
            _receiver != address(0) &&
                _receiver != address(this) &&
                _receiver != receiver,
            "Receiver address is not valid"
        );
        emit ReceiverChanged(receiver, _receiver);
        receiver = _receiver;
    }

    function setFeePercent(uint16 _feePercent) public onlyOwner {
        require(
            _feePercent <= DENOMINATOR,
            "Fee percent is not valid, must be less than or equal to 10_000"
        );
        emit FeePercentChanged(feePercent, _feePercent);
        feePercent = _feePercent;
    }

    function withdraw(uint256 amount, address destination) public onlyOwner {
        require(
            amount <= address(this).balance,
            "Withdraw amount must be less than or equal to the contract balance"
        );
        emit Withdrawn(destination, amount);
        payable(destination).transfer(amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
