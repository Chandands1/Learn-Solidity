// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title AssemblyWriteSlot - Write to storage slot using assembly
contract AssemblyWriteSlot {
    uint public data;

    function writeSlot(uint _val) public {
        assembly {
            sstore(0, _val)
        }
    }
}
