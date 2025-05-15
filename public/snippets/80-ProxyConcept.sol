// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ProxyConcept - Very basic proxy contract using delegatecall

contract Logic {
    uint public x;

    function setX(uint _x) public {
        x = _x;
    }
}

contract ProxyConcept {
    address public logicContract;

    constructor(address _logic) {
        logicContract = _logic;
    }

    function setXViaProxy(uint _x) public {
        (bool success, ) = logicContract.delegatecall(
            abi.encodeWithSignature("setX(uint256)", _x)
        );
        require(success, "Delegatecall failed");
    }
}
