// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract CustomErrorBank{

    address public owner;
    mapping(address => uint256) public balances;

    //Custom Errors

    error NotOwner();
    error InsuficientFunds(uint256 requested, uint256 available);

    error ZeroDeposite();

    constructor(){
        owner = msg.sender;
    }

    function deposite() external payable{
        if(msg.value == 0){
            revert ZeroDeposite();
        }
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) external{
        uint256 balance = balances[msg.sender];

        if(_amount>balance){
            revert InsuficientFunds({requested: _amount, available: balance});
        }

        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function emergencyWithdrawAll() external{
        //check if the caller is not the owner
        if(msg.sender != owner){
            revert NotOwner();
        }

        payable(owner).transfer(address(this).balance);
    }

    function getBalance() external view returns (uint256){
        return balances[msg.sender];
    }






}