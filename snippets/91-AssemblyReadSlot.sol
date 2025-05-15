// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title AssemblyReadSlot - Read storage using assembly
contract AssemblyReadSlot {
    uint public data = 123;

    function readSlot() public view returns (uint value) {
        assembly {
            value := sload(0)
        }
    }
}
