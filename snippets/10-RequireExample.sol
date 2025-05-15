// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract RequireExample{
    uint256 public minimumAge =18;

    event AccessGranted(address user, uint256 age);

    function enter(uint256 _age) public{
        require(_age >= minimumAge, "You must be at least 18 years old");

        emit AccessGranted(msg.sender, _age);
    }
}