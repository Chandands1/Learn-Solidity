// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title StringStorage - Shows how to store and retrieve strings
contract StringStorage {
    string public message;

    /// @notice Sets the string message
    function setMessage(string memory _msg) public {
        message = _msg;
    }

    /// @notice Gets the stored string
    function getMessage() public view returns (string memory) {
        return message;
    }
}
