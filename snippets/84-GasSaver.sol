// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title GasSaver - Shows how to optimize gas using `uint8` packing

contract GasSaver {
    // fits in one 32-byte slot
    struct Packed {
        uint8 a;
        uint8 b;
        uint8 c;
        uint8 d;
    }

    Packed public values;

    function setValues(uint8 _a, uint8 _b, uint8 _c, uint8 _d) public {
        values = Packed(_a, _b, _c, _d);
    }
}
