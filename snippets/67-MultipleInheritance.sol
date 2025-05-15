// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title MultipleInheritance - Demonstrates multiple inheritance
contract A {
    function who() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B {
    function where() public pure virtual returns (string memory) {
        return "B";
    }
}

contract MultipleInheritance is A, B {
    function combined() public pure returns (string memory, string memory) {
        return (who(), where());
    }
}
