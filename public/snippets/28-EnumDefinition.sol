// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title EnumDefinition - Demonstrates use of enum in Solidity
contract EnumDefinition {
    enum Status { Pending, Shipped, Delivered }

    Status public status;

    function setShipped() public {
        status = Status.Shipped;
    }

    function setDelivered() public {
        status = Status.Delivered;
    }

    function reset() public {
        status = Status.Pending;
    }

    function getStatus() public view returns (Status) {
        return status;
    }
}
