// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title AssemblyMemory - Manipulating memory directly
contract AssemblyMemory {
    function getMemoryBytes() public pure returns (bytes memory result) {
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, 32)
            mstore(add(ptr, 32), 0x1234567890abcdef)
            mstore(0x40, add(ptr, 64))
            result := ptr
        }
    }
}
