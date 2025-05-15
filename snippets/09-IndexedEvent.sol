// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract IndexedEvent{

    event LogTransfer(address indexed from, address to, uint256 amount);

   function  transfer(address _to, uint256 _amount) public{

        emit LogTransfer(msg.sender, _to, _amount);
    }
}