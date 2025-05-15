// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title LowLevelCall - Demonstrates `call` for dynamic function invocation
contract Target {
    uint public value;

    function setValue(uint _val) public {
        value = _val;
    }
}

contract LowLevelCall {
    function callSetValue(address _target, uint _val) public returns (bool, bytes memory) {
        return _target.call(abi.encodeWithSignature("setValue(uint256)", _val));
    }
}
