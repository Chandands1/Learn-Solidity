// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Withdrawal - Allows users to deposit and withdraw Ether
contract Withdrawal {
    mapping(address => uint) public balances;

    /// @notice Allows users to deposit Ether
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    /// @notice Allows user to withdraw their balance
    function withdraw() public {
        uint amount = balances[msg.sender];
        require(amount > 0, "Nothing to withdraw");
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }

    /// @notice Get contract balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
