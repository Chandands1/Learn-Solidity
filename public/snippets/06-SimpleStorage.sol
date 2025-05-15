// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract SimpleStorage{

    //unsinged int declaration
    uint256 private number;

    //storing the value to the variable
    function storeValue(uint256 _number)public{
        number = _number;
    }

    //getting the stored value
    function getValue() public view returns(uint256){
        return number;
    }

}