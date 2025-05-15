// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ClearArray - Shows how to clear arrays in Solidity
contract ClearArray {
    uint[] public numbers;

    /// @notice Adds number to array
    function addNumber(uint _num) public {
        numbers.push(_num);
    }

    /// @notice Clears the entire array
    function clearAll() public {
        delete numbers;
    }

    /// @notice Returns current array
    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }
}
