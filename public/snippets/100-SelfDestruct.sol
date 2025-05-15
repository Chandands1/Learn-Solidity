// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SelfDestruct - Destroys contract and sends funds
contract SelfDestruct {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function destroy() public {
        require(msg.sender == owner, "Not owner");
        selfdestruct(owner);
    }

    receive() external payable {}
}
