// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title DelegateCall - Shows how delegatecall preserves context
contract Logic {
    uint public num;

    function setNum(uint _num) public {
        num = _num;
    }
}

contract Proxy {
    uint public num;

    function delegateTo(address _logic, uint _num) public {
        (bool success, ) = _logic.delegatecall(
            abi.encodeWithSelector(Logic.setNum.selector, _num)
        );
        require(success, "delegatecall failed");
    }
}
