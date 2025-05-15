// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title StructMapping - Mapping with structs to store user info
contract StructMapping {
    struct User {
        string name;
        uint age;
    }

    mapping(address => User) public users;

    function setUser(string memory _name, uint _age) public {
        users[msg.sender] = User(_name, _age);
    }

    function getUser(address _addr) public view returns (string memory, uint) {
        User memory u = users[_addr];
        return (u.name, u.age);
    }
}
