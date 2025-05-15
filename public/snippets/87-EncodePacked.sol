// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title EncodePacked - Demonstrates abi.encodePacked for compact encoding
contract EncodePacked {
    function getPackedData(string memory _a, string memory _b) public pure returns (bytes memory) {
        return abi.encodePacked(_a, _b);
    }

    function hashPacked(string memory _a, string memory _b) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_a, _b));
    }
}
