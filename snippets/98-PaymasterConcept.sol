// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title PaymasterConcept - Illustrates a basic concept of relaying tx fees
contract PaymasterConcept {
    address public relayer;

    constructor() {
        relayer = msg.sender;
    }

    function execute(address _target, bytes calldata _data) external {
        require(msg.sender == relayer, "Only relayer allowed");

        (bool success, ) = _target.call(_data);
        require(success, "Execution failed");
    }
}
