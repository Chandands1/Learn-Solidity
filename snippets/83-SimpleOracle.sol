// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SimpleOracle - Basic on-chain oracle for storing external data

contract SimpleOracle {
    address public admin;
    uint public price;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    function updatePrice(uint _newPrice) public onlyAdmin {
        price = _newPrice;
    }

    function getPrice() public view returns (uint) {
        return price;
    }
}
