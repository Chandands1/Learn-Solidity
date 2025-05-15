// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SimpleModifier - Example of using modifiers for access control
contract SimpleModifier {
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    function changeAdmin(address _newAdmin) public onlyAdmin {
        admin = _newAdmin;
    }

    function getAdmin() public view returns (address) {
        return admin;
    }
}
