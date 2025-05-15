// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title BytesStorage - Demonstrates storing and retrieving bytes
contract BytesStorage {
    bytes public data;

    function setData(bytes memory _input) public {
        data = _input;
    }

    function getData() public view returns (bytes memory) {
        return data;
    }
}
