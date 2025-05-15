// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title BasicMultisig - Simple 2-of-3 multisig wallet

contract BasicMultisig {
    address[3] public owners;
    uint public confirmationsRequired = 2;

    struct Transaction {
        address to;
        uint value;
        uint confirmations;
        bool executed;
        mapping(address => bool) approved;
    }

    Transaction[] public transactions;

    modifier onlyOwner() {
        require(isOwner(msg.sender), "Not owner");
        _;
    }

    constructor(address[3] memory _owners) {
        owners = _owners;
    }

    function isOwner(address _addr) internal view returns (bool) {
        for (uint i = 0; i < 3; i++) {
            if (owners[i] == _addr) return true;
        }
        return false;
    }

    function submit(address _to, uint _value) public onlyOwner {
        transactions.push();
        Transaction storage txn = transactions[transactions.length - 1];
        txn.to = _to;
        txn.value = _value;
    }

    function confirm(uint _index) public onlyOwner {
        Transaction storage txn = transactions[_index];
        require(!txn.executed, "Already executed");
        require(!txn.approved[msg.sender], "Already confirmed");

        txn.approved[msg.sender] = true;
        txn.confirmations++;

        if (txn.confirmations >= confirmationsRequired) {
            txn.executed = true;
            payable(txn.to).transfer(txn.value);
        }
    }

    receive() external payable {}
}
