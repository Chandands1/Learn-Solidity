// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract StructDefinition{

    struct Person{
        string name;
        uint256 age;
        address wallet;
    }

    //store one person
    Person public singlePerson;

    //array of people
    Person[] public people;

    mapping(address => Person) public personByAddress;

    //set a single person directly
    function setSinglePerson(string memory _name, uint256 _age) public{
        singlePerson = Person(_name,_age,msg.sender);
    }

    //add the person to the array
    function addPerson(string memory _name, uint256 _age) public{
        Person memory newPerson = Person(_name, _age, msg.sender);
        people.push(newPerson); // add to array
        personByAddress[msg.sender] = newPerson; // add to mapping
    }

    //get the details of a person from array
    function getPerson(uint256 index) public view returns(string memory, uint256, address){
        require(index < people.length,"Index out of bounds");
        Person memory p = people[index];
        return (p.name, p.age, p.wallet);
    }

    //get total number of people
    function getPeopleCount() public view returns(uint256){
        return people.length;
    }


}