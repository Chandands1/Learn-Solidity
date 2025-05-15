// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title StaticCall - Demonstrates read-only `staticcall`
contract StorageBox {
    uint private data;

    constructor(uint _data) {
        data = _data;
    }

    function getData() external view returns (uint) {
        return data;
    }
}

contract StaticCaller {
    function readData(address _target) public view returns (uint result) {
        (bool success, bytes memory response) = _target.staticcall(
            abi.encodeWithSignature("getData()")
        );
        require(success, "staticcall failed");
        result = abi.decode(response, (uint));
    }
}
