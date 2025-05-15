// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SimpleERC20 - Basic ERC20 implementation
contract SimpleERC20 {
    string public name = "SimpleToken";
    string public symbol = "SIM";
    uint8 public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint amount);

    constructor(uint _supply) {
        totalSupply = _supply * 10**decimals;
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint _amount) public returns (bool) {
        require(balanceOf[msg.sender] >= _amount, "Not enough balance");
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
}
