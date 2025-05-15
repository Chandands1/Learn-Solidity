// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

/// @title MerkleProofExample - Verify inclusion in a Merkle Tree
contract MerkleProofExample {
    bytes32 public merkleRoot;

    constructor(bytes32 _root) {
        merkleRoot = _root;
    }

    function verify(bytes32[] calldata _proof, bytes32 _leaf) public view returns (bool) {
        return MerkleProof.verify(_proof, merkleRoot, _leaf);
    }
}
