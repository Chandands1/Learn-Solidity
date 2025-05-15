// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ERC20Mintable - Adds minting to basic ERC20 token
contract ERC20Mintable {
    string public name = "MintableToken";
    string public symbol = "MINT";
    uint8 public decimals = 18;
    uint public totalSupply;
    address public owner;

    mapping(address => uint) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint amount);
    event Mint(address indexed to, uint amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function mint(address _to, uint _amount) public onlyOwner {
        balanceOf[_to] += _amount;
        totalSupply += _amount;
        emit Mint(_to, _amount);
        emit Transfer(address(0), _to, _amount);
    }

    function transfer(address _to, uint _amount) public returns (bool) {
        require(balanceOf[msg.sender] >= _amount, "Not enough balance");
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
}
