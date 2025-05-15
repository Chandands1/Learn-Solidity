// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title TransientStorage - Demo of per-call storage (simulated)
contract TransientStorage {
    uint private temp;

    function setTemp(uint _val) public {
        temp = _val;
    }

    function getTemp() public view returns (uint) {
        return temp;
    }
}
