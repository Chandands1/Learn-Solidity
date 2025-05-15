// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract AssertExample{
    uint256 public value;

    constructor(){
        value =10;
    }

    function increase(uint256 _amount)public{
        value += _amount;

        assert(value>=_amount);
    }

    function decrease(uint256 _amount) public{
        require(_amount <= value,"Not enough value to decrease");
        value -= _amount;

        assert(value >= 0);
    }

    function reset() public{
        value =10;

        assert(value == 10);
    }


}