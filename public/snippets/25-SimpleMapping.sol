// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SimpleMapping - Demonstrates how to use a basic mapping in Solidity
contract SimpleMapping {
    mapping(address => uint) public balances;

    /// @notice Adds value to the sender's balance
    function addBalance(uint _value) public {
        balances[msg.sender] += _value;
    }

    /// @notice Retrieves the balance of a specific address
    function getBalance(address _user) public view returns (uint) {
        return balances[_user];
    }
}
