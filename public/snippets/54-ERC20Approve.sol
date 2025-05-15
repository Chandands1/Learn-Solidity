// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ERC20Approve - Adds approve and transferFrom to ERC20
contract ERC20Approve {
    string public name = "ApprovedToken";
    string public symbol = "APRV";
    uint8 public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);

    constructor(uint _supply) {
        totalSupply = _supply * 10**decimals;
        balanceOf[msg.sender] = totalSupply;
    }

    function approve(address _spender, uint _amount) public returns (bool) {
        allowance[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

    function transfer(address _to, uint _amount) public returns (bool) {
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance");
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }

    function transferFrom(address _from, address _to, uint _amount) public returns (bool) {
        require(balanceOf[_from] >= _amount, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _amount, "Not allowed");
        balanceOf[_from] -= _amount;
        allowance[_from][msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        emit Transfer(_from, _to, _amount);
        return true;
    }
}
