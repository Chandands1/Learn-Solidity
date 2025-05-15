// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract Greeter{

    string private greeting;
    address public owner;

    constructor(string memory _initialGreeting){
        greeting = _initialGreeting;
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function getGreeting() public view returns(string memory){
        return greeting;
    }

    function setGreeting( string memory _newGreeting) public onlyOwner{
        greeting = _newGreeting;
    }
}