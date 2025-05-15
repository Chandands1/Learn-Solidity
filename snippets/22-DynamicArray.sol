// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract DynamicArray{
    uint256[] public numbers;

    function addNumber(uint256 _number) public{
        numbers.push(_number);
    }

    function removeLast() public{
        require(numbers.length> 0, " Array is already empty");
        numbers.pop();
    }

    function getNumber(uint256 index) public view returns(uint256){
        require(index< numbers.length,"Index out of bounds");
        return numbers[index];
    }

    function deleteAt(uint256 index)public{
        require(index < numbers.length,"Index out of bounds");
        delete numbers[index];
    }

    function getAllNumbers() public view returns(uint256[] memory){
        return numbers;
    }

    function getLength() public view returns(uint256){
        return numbers.length;
    }


}