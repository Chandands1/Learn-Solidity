// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title UUPSProxy - Basic illustration of a UUPS upgradeable pattern

contract UUPSImplementation {
    uint public number;

    function setNumber(uint _num) public {
        number = _num;
    }
}

contract UUPSProxy {
    address public implementation;

    constructor(address _impl) {
        implementation = _impl;
    }

    fallback() external payable {
        address impl = implementation;
        require(impl != address(0), "No implementation");

        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(gas(), impl, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
        }
    }
}
