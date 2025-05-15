// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ContractCreator - Dynamically creates a new contract
contract SimpleStorage {
    uint public data;

    constructor(uint _x) {
        data = _x;
    }
}

contract ContractCreator {
    address[] public deployedContracts;

    function createNew(uint _value) public {
        SimpleStorage s = new SimpleStorage(_value);
        deployedContracts.push(address(s));
    }

    function getDeployed(uint index) public view returns (address) {
        return deployedContracts[index];
    }
}
