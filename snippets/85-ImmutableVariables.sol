// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ImmutableVariables - Demonstrates use of `immutable` keyword
contract ImmutableVariables {
    address public immutable owner;
    uint public immutable creationTime;

    constructor() {
        owner = msg.sender;
        creationTime = block.timestamp;
    }

    function getInfo() public view returns (address, uint) {
        return (owner, creationTime);
    }
}
