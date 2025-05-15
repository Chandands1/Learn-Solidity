// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Packing - Demonstrates storage packing of variables
contract Packing {
    // These 3 variables can be packed into a single 256-bit slot
    uint128 public a = 1;
    uint64 public b = 2;
    uint64 public c = 3;

    /// @notice Sets all values at once
    function setAll(uint128 _a, uint64 _b, uint64 _c) public {
        a = _a;
        b = _b;
        c = _c;
    }
}
