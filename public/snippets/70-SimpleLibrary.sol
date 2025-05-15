// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SimpleLibrary - Demonstrates usage of a basic external library

library MathLib {
    function add(uint a, uint b) internal pure returns (uint) {
        return a + b;
    }
}

contract SimpleLibrary {
    function useAdd(uint x, uint y) public pure returns (uint) {
        return MathLib.add(x, y);
    }
}
