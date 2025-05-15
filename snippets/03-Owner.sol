// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract Owner{

    address public owner;

    constructor(address _owner){
        owner = _owner;
    }

    function getOwner() public view returns(address){
        return owner;
    }



}