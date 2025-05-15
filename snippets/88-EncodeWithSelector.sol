// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title EncodeWithSelector - Shows how to encode function call with selector
contract Target {
    uint public x;

    function setX(uint _x) public {
        x = _x;
    }
}

contract EncodeWithSelector {
    function encodeCall(address _target, uint _x) public {
        (bool success, ) = _target.call(
            abi.encodeWithSelector(Target.setX.selector, _x)
        );
        require(success, "Call failed");
    }
}
