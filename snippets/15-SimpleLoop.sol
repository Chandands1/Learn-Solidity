// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract SimpleLoop{

    uint256 public totalSum;

    function computeSum(uint256 n) public{
        uint256 sum =0;

        for(uint256 i =0;i<=n; i++){
            sum+=i;
        }
        totalSum = sum;
    }

    function getSum() public view returns(uint256){
        return totalSum;
    }

}