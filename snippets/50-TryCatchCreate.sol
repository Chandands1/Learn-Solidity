// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title TryCatchCreate - Demonstrates try/catch when creating contracts
contract Inner {
    constructor(uint _x) {
        require(_x != 0, "Zero not allowed");
    }
}

contract TryCatchCreate {
    address public lastDeployed;
    string public error;

    function createInner(uint _x) public {
        try new Inner(_x) returns (Inner instance) {
            lastDeployed = address(instance);
            error = "";
        } catch Error(string memory reason) {
            error = reason;
        }
    }
}
