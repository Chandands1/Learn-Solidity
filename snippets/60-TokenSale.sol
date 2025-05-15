// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title TokenSale - Sells custom ERC20 tokens for ETH
contract MyToken {
    string public name = "SaleToken";
    string public symbol = "SALE";
    uint8 public decimals = 18;
    uint public totalSupply;
    address public owner;

    mapping(address => uint) public balanceOf;

    constructor(uint _supply) {
        totalSupply = _supply * 10**decimals;
        balanceOf[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer(address _to, uint _amount) public returns (bool) {
        require(balanceOf[msg.sender] >= _amount, "Insufficient");
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        return true;
    }
}

contract TokenSale {
    MyToken public token;
    address public admin;
    uint public pricePerToken;

    constructor(MyToken _token, uint _pricePerToken) {
        token = _token;
        admin = msg.sender;
        pricePerToken = _pricePerToken;
    }

    function buyTokens(uint _amount) public payable {
        require(msg.value == _amount * pricePerToken, "Incorrect ETH");
        token.transfer(msg.sender, _amount);
    }

    function withdraw() public {
        require(msg.sender == admin, "Not admin");
        payable(admin).transfer(address(this).balance);
    }
}
