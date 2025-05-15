// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title FallbackEther - Demonstrates fallback function usage
contract FallbackEther {
    event Received(string func, uint amount);

    /// @notice Called when no matching function exists or data is non-empty
    fallback() external payable {
        emit Received("fallback", msg.value);
    }

    /// @notice Called when no data is sent
    receive() external payable {
        emit Received("receive", msg.value);
    }
}
