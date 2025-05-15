// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ModifierWithArgs - Demonstrates modifiers that take arguments
contract ModifierWithArgs {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyBy(address _addr) {
        require(msg.sender == _addr, "Not authorized");
        _;
    }

    function changeOwner(address _newOwner) public onlyBy(owner) {
        owner = _newOwner;
    }
}
