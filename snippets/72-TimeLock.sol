// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title TimeLock - Locks ETH for a fixed time before withdrawal

contract TimeLock {
    mapping(address => uint) public lockTime;
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
        lockTime[msg.sender] = block.timestamp + 1 days;
    }

    function withdraw() public {
        require(block.timestamp >= lockTime[msg.sender], "Too early");
        uint amount = balances[msg.sender];
        require(amount > 0, "No funds");
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
