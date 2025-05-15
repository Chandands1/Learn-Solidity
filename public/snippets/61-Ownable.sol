// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Ownable - Basic ownership pattern
contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}
