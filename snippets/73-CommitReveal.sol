// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title CommitReveal - Basic commit-reveal scheme

contract CommitReveal {
    mapping(address => bytes32) public commits;
    mapping(address => string) public revealed;

    function commit(bytes32 _hash) public {
        commits[msg.sender] = _hash;
    }

    function reveal(string memory _secret) public {
        require(commits[msg.sender] == keccak256(abi.encodePacked(_secret)), "Invalid secret");
        revealed[msg.sender] = _secret;
    }
}
