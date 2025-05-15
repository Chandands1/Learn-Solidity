// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Pausable - Adds emergency stop mechanism
contract Pausable {
    address public owner;
    bool public paused;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier whenNotPaused() {
        require(!paused, "Paused");
        _;
    }

    function togglePause() public onlyOwner {
        paused = !paused;
    }

    function doSomething() public view whenNotPaused returns (string memory) {
        return "Doing something important";
    }
}
