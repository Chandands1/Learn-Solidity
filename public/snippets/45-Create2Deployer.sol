// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Create2Deployer - Deploy contracts with deterministic addresses using CREATE2

contract Simple {
    uint public x;

    constructor(uint _x) {
        x = _x;
    }
}

contract Create2Deployer {
    event Deployed(address addr);

    function deploy(uint _x, bytes32 _salt) public {
        bytes memory bytecode = abi.encodePacked(
            type(Simple).creationCode,
            abi.encode(_x)
        );

        address addr;
        assembly {
            addr := create2(0, add(bytecode, 0x20), mload(bytecode), _salt)
            if iszero(extcodesize(addr)) {
                revert(0, 0)
            }
        }

        emit Deployed(addr);
    }

    function computeAddress(bytes32 _salt, bytes memory bytecode) public view returns (address) {
        bytes32 hash = keccak256(
            abi.encodePacked(
                bytes1(0xff),
                address(this),
                _salt,
                keccak256(bytecode)
            )
        );
        return address(uint160(uint(hash)));
    }
}
