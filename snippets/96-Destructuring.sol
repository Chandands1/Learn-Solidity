// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Destructuring - Shows tuple destructuring
contract Destructuring {
    function getValues() public pure returns (uint, bool) {
        return (123, true);
    }

    function useDestructure() public pure returns (uint x, bool y) {
        (x, y) = getValues();
    }
}
