// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract RevertExample{

    address public owner;
    uint256 public balance;

    //custom error
    error NotOwner();
    error InsufficientBalance(uint256 requested, uint256 available);

    constructor(){
        owner = msg.sender;
        balance =100;
    }

    function withdraw(uint256 _amount) public{
        if(msg.sender != owner){
            revert NotOwner();
        }

        if(_amount > balance){
            revert InsufficientBalance({requested: _amount, available: balance});
        }
        balance -= _amount;


    }

    function deposite(uint256 _amount) public{
        if(_amount ==0){
            revert("Deposite amount must be greater than zero");
        }
        balance += _amount;
    }

}