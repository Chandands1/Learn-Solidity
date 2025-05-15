// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title InterfaceUsage - Demonstrates calling another contract via interface

interface Counter {
    function increment() external;
    function get() external view returns (uint);
}

contract InterfaceUsage {
    function useCounter(address _counter) public {
        Counter(_counter).increment();
    }

    function fetchCount(address _counter) public view returns (uint) {
        return Counter(_counter).get();
    }
}
