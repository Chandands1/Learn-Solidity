// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title PayableFunction - Shows how to make functions receive Ether
contract PayableFunction {
    address public owner;
    uint public received;

    constructor() {
        owner = msg.sender;
    }

    /// @notice Payable function that accepts Ether
    function sendEther() external payable {
        received += msg.value;
    }

    /// @notice Returns balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
