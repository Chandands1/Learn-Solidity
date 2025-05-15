// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SimpleVoting - Basic voting between 2 options

contract SimpleVoting {
    uint public yesVotes;
    uint public noVotes;

    mapping(address => bool) public hasVoted;

    function vote(bool _yes) public {
        require(!hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;

        if (_yes) {
            yesVotes++;
        } else {
            noVotes++;
        }
    }
}
