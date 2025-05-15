// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title TryCatchExternal - Demonstrates try/catch with external call
contract External {
    function willRevert(bool _revert) external pure returns (uint) {
        require(!_revert, "Forced revert");
        return 42;
    }
}

contract TryCatchExternal {
    uint public result;
    string public error;

    function tryCall(address _ext, bool _fail) public {
        try External(_ext).willRevert(_fail) returns (uint value) {
            result = value;
            error = "";
        } catch Error(string memory reason) {
            error = reason;
        }
    }
}
