// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Inheritance - Basic single-level inheritance
contract Parent {
    function greet() public pure returns (string memory) {
        return "Hello from Parent";
    }
}

contract Inheritance is Parent {
    function greetChild() public pure returns (string memory) {
        return "Hello from Child";
    }
}
