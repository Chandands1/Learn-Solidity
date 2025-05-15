// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title AssemblyLoop - Demonstrates looping in assembly
contract AssemblyLoop {
    function sumToN(uint _n) public pure returns (uint sum) {
        assembly {
            let i := 0
            for { } lt(i, _n) { i := add(i, 1) } {
                sum := add(sum, i)
            }
        }
    }
}
