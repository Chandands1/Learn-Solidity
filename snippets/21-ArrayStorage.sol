// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract ArrayStorage{
    uint256[5] public fixedArray;

    //function to store a value at a specific index
    function setValue(uint256 index, uint256 value) public{
        require(index < fixedArray.length, "Index out of bounds");

        fixedArray[index] = value;
    }

    //Function to get a value from the array

    function getValue(uint256 index) public view returns(uint256){
        require(index< fixedArray.length,"Index out of bounds");

        return fixedArray[index];
    }

    //returns the full array
    function getFullArray() public view returns(uint256[5] memory){
        return fixedArray;
    }

    function getLength() public pure returns (uint256){
        return 5; //since it is fixed array the length is already know
    }



}