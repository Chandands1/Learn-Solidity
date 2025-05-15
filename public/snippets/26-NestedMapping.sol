// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title NestedMapping - Example of nested mappings for approvals
contract NestedMapping {
    mapping(address => mapping(address => bool)) public isApproved;

    function setApproval(address _delegate, bool _status) public {
        isApproved[msg.sender][_delegate] = _status;
    }

    function checkApproval(address _owner, address _delegate) public view returns (bool) {
        return isApproved[_owner][_delegate];
    }
}
