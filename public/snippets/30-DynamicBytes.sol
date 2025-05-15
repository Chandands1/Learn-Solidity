// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title DynamicBytes - Demonstrates working with dynamic byte arrays
contract DynamicBytes {
    bytes public data;

    /// @notice Stores dynamic bytes into contract storage
    function setBytes(bytes memory _data) public {
        data = _data;
    }

    /// @notice Appends a byte to the existing data
    function appendByte(bytes memory _b) public {
        data.push(_b);
    }

    /// @notice Returns length of stored bytes
    function length() public view returns (uint) {
        return data.length;
    }
}
