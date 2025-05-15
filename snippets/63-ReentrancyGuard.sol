// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ReentrancyGuard - Prevents reentrancy attacks
contract ReentrancyGuard {
    mapping(address => uint) public balances;
    bool internal locked;

    modifier noReentrant() {
        require(!locked, "Reentrant call");
        locked = true;
        _;
        locked = false;
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public noReentrant {
        uint amount = balances[msg.sender];
        require(amount > 0, "Nothing to withdraw");
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
