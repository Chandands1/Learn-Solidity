// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title MinimalProxy - EIP-1167 minimal proxy clone
contract MinimalProxy {
    function clone(address implementation) external returns (address proxy) {
        bytes20 targetBytes = bytes20(implementation);

        assembly {
            let clone := mload(0x40)
            mstore(clone, 0x3d602d80600a3d3981f3)
            mstore(add(clone, 0x14), shl(0x60, targetBytes))
            mstore(add(clone, 0x28), 0x5af43d82803e903d91602b57fd5bf3)
            proxy := create(0, clone, 0x37)
        }
    }
}
