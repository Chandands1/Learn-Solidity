// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title AbstractContract - Uses an abstract base with virtual function
abstract contract AbstractContractBase {
    function getValue() public view virtual returns (uint);
}

contract AbstractContract is AbstractContractBase {
    uint private value = 100;

    function getValue() public view override returns (uint) {
        return value;
    }
}
