// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title DataLocations - Explains storage, memory, and calldata
contract DataLocations {
    string[] public names;

    /// @notice Adds a name to the storage array
    function addName(string memory _name) public {
        names.push(_name);
    }

    /// @notice Returns a name from storage array
    function getName(uint _index) public view returns (string memory) {
        return names[_index];
    }

    /// @notice Reads from calldata and returns a copy in memory
    function echoName(string calldata _name) external pure returns (string memory) {
        return _name;
    }
}
