// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract Counter{
    uint256 private count;

    function countIncreement() public{
        count++;
    }

    function countDecreement() public{
        count--;
    }

    function getCount() public view returns (uint256){
        return count;

    }
}