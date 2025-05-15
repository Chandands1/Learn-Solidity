// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ABIEncodeDecode - Demonstrates abi.encode and abi.decode
contract ABIEncodeDecode {
    function encodeData(string memory _msg, uint _num) public pure returns (bytes memory) {
        return abi.encode(_msg, _num);
    }

    function decodeData(bytes memory _data) public pure returns (string memory, uint) {
        return abi.decode(_data, (string, uint));
    }
}
