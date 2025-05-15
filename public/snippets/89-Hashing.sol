// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Hashing - Demonstrates hashing with keccak256
contract Hashing {
    function hashString(string memory _input) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_input));
    }

    function hashMultiple(string memory _a, uint _b) public pure returns (bytes32) {
        return keccak256(abi.encode(_a, _b));
    }
}
