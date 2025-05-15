// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ContractCaller - Calls another contract's function
contract Callee {
    uint public x;

    function setX(uint _x) public {
        x = _x;
    }
}

contract ContractCaller {
    function callSetX(address _callee, uint _x) public {
        Callee(_callee).setX(_x);
    }

    function getX(address _callee) public view returns (uint) {
        return Callee(_callee).x();
    }
}
