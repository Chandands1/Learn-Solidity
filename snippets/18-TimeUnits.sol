// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract TimeUnits{
    uint256 public deployTime;

    constructor(){
        deployTime = block.timestamp;
    }

    //check if 1 minute has passed since deployment

    function isOneMinuteOver() public view returns(bool){
       return block.timestamp >= deployTime + 1 minutes;
    }

    //check if 1 hour has passed
    function isOneHourOver() public view returns(bool){
        return block.timestamp >= deployTime + 1 hours;
    }

    //check if 1 day has passed
    function isOneDayOver() public view returns(bool){
        return block.timestamp >= deployTime +1 days;
    }

    //return how many seconds since the contract deployed
    function secondsSinceDeployed() public view returns (uint256){
        return block.timestamp - deployTime;
    }

    function timeUnitValues() public pure returns (uint256, uint256, uint256, uint256) {
        return (
            1 minutes,  // 60 seconds
            1 hours,    // 3600 seconds
            1 days,     // 86400 seconds
            1 weeks     // 604800 seconds
        );
    }
}