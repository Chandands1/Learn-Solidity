// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title AddressMembers - Demonstrates address-related functions
contract AddressMembers {
    event Received(uint amount);
    event Sent(address to, uint amount);

    /// @notice Send Ether to another address
    function sendTo(address payable _to) public payable {
        require(msg.value > 0, "Send some ETH");
        _to.transfer(msg.value);
        emit Sent(_to, msg.value);
    }

    /// @notice Get balance of any address
    function getBalance(address _addr) public view returns (uint) {
        return _addr.balance;
    }

    receive() external payable {
        emit Received(msg.value);
    }
}
