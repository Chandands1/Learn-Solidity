// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title TypeInformation - Shows how to inspect types at runtime
contract TypeInformation {
    function getTypeHash() public pure returns (bytes32) {
        return keccak256(abi.encodePacked(type(TypeInformation).name));
    }
}
