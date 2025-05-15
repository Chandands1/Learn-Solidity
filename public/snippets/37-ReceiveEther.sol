// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ReceiveEther - Demonstrates the `receive()` function
contract ReceiveEther {
    uint public totalReceived;

    /// @notice This special function is triggered when contract receives Ether without data
    receive() external payable {
        totalReceived += msg.value;
    }

    /// @notice Returns contract's balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
