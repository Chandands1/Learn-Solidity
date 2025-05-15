// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract ViewPureFunctions{
    uint256 public storeValue =10;

    //view function
    function getStoreValue() public view returns(uint256){
        return storeValue;
    }

    //pure function

    function multiple(uint256 a, uint256 b) public pure returns(uint256){
        return a*b;
    }

    //update the value
    function setStoredValue(uint256 _value) public{
        storeValue += _value;
    }
}