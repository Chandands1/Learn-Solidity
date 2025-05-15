// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract SimpleEvent{
    uint256 public value;

    //declare an event
    event valueChanged(address indexed updater, uint256 oldValue, uint256 newValue);

    //Function to update value and emit event
    function updateValue(uint256 _newValue) public{
        uint256 old = value;
        value = _newValue;

        //emit the event
        emit valueChanged(msg.sender, old, _newValue);
    }


}