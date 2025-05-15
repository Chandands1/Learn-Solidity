// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract Conditional{
    string public result;

    function checkNumber(int256 _number)public{
        if(_number>0){
            result ="Positive";
        }
        else if(_number< 0){
            result = "Negative";
        }
        else{
            result = "Zero";
        }
    }

    function isEven(uint256 number) public pure returns(string memory){
        if(number %2 ==0){
            return "Even";
        }else{
            return "Odd";
        }
    }
}