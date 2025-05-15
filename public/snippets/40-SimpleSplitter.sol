// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SimpleSplitter - Splits Ether between two addresses
contract SimpleSplitter {
    address payable public user1;
    address payable public user2;

    constructor(address payable _user1, address payable _user2) {
        user1 = _user1;
        user2 = _user2;
    }

    /// @notice Split incoming Ether between two users
    receive() external payable {
        uint half = msg.value / 2;
        user1.transfer(half);
        user2.transfer(msg.value - half); // handle odd wei
    }
}
