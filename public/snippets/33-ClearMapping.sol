// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ClearMapping - Demonstrates clearing/deleting mapping entries
contract ClearMapping {
    mapping(address => uint) public balances;

    /// @notice Set balance for sender
    function setBalance(uint _amount) public {
        balances[msg.sender] = _amount;
    }

    /// @notice Clears the balance of sender
    function clearMyBalance() public {
        delete balances[msg.sender];
    }
}
