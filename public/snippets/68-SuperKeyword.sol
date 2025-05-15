// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SuperKeyword - Demonstrates use of `super`
contract Base {
    function describe() public pure virtual returns (string memory) {
        return "Base";
    }
}

contract Mid is Base {
    function describe() public pure virtual override returns (string memory) {
        return string(abi.encodePacked(super.describe(), " → Mid"));
    }
}

contract SuperKeyword is Mid {
    function describe() public pure override returns (string memory) {
        return string(abi.encodePacked(super.describe(), " → SuperKeyword"));
    }
}
