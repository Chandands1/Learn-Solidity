// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Factory - Deploys instances of a simple contract

contract Product {
    address public creator;

    constructor() {
        creator = msg.sender;
    }
}

contract Factory {
    address[] public deployed;

    function createProduct() public {
        Product newProduct = new Product();
        deployed.push(address(newProduct));
    }

    function getDeployed() public view returns (address[] memory) {
        return deployed;
    }
}
