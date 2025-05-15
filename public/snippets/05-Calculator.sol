// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract Calculator{

    function addition(uint256 _number1, uint256 _number2) public pure returns(uint256){
        return (_number1+_number2);
    }

    function substraction(uint256 _number1, uint256 _number2) public pure returns(uint256){
        require(_number1>=_number2, "Negative");
        return(_number1-_number2);
    }

    function multiplication(uint256 _number1, uint256 _number2) public pure returns(uint256){
        return(_number1*_number2);
    }

    function division(uint256 _number1, uint256 _number2) public pure returns(uint256){
        require(_number2 >0, "cannot divided by zero");
        return (_number1/_number2);
    }

    
}