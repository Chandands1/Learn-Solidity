// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract EtherUnits{

    uint256 public oneEtherInWei = 1 ether;

    uint256 public oneGweiInWei = 1 gwei;

    uint256 public receivedInWei;

    function receiveEther() public payable{
        receivedInWei = msg.value;
    }

    function getReceivedInEther() public view returns (uint256){
        return receivedInWei /1 ether;
    }

    function getReceivedInGwei() public view returns(uint256){
        return receivedInWei/1 ether;
    }



}