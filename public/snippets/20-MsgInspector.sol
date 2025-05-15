// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract MsgInspector{
    //stores the last address that sent ether
    address public lastSender;

    //stores the last amount of ether sent(in wei)
    uint256 public lastValue;

    //Logs each payment with details
    event Received(address indexed sender, uint256 amount);

    //payable function to receive ether and record sender and value
    function inspect() public payable{
        lastSender = msg.sender;
        lastValue = msg.value;

        emit Received(msg.sender, msg.value);
    }


    //function to get last sender and value
    function getLastTransaction() public view returns (address, uint256){
        return (lastSender, lastValue);
    }

    //Return current contract balance in wei
    function getContractBalance() public view returns(uint256){
        return address(this).balance;
    }

}