// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title NamedParams - Using named parameters with structs
contract NamedParams {
    struct User {
        string name;
        uint age;
    }

    User public user;

    function setUser(string memory _name, uint _age) public {
        user = User({name: _name, age: _age});
    }
}
