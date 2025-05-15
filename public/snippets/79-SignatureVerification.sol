// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SignatureVerification - Verifies off-chain signed messages
contract SignatureVerification {
    function getMessageHash(string memory _message) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignedMessageHash(bytes32 _msgHash) public pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _msgHash));
    }

    function verify(address _signer, string memory _message, bytes memory _signature) public pure returns (bool) {
        bytes32 msgHash = getMessageHash(_message);
        bytes32 ethSignedHash = getEthSignedMessageHash(msgHash);

        return recover(ethSignedHash, _signature) == _signer;
    }

    function recover(bytes32 _ethSignedMessageHash, bytes memory _sig) public pure returns (address) {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_sig);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function splitSignature(bytes memory sig) internal pure returns (bytes32 r, bytes32 s, uint8 v) {
        require(sig.length == 65, "Invalid signature length");

        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))
        }
    }
}
