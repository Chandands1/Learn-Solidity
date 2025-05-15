// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title InternalLibrary - Internal library with reusable logic

library StringHelper {
    function appendExclaim(string memory base) internal pure returns (string memory) {
        return string(abi.encodePacked(base, "!"));
    }
}

contract InternalLibrary {
    function shout(string memory input) public pure returns (string memory) {
        return StringHelper.appendExclaim(input);
    }
}
