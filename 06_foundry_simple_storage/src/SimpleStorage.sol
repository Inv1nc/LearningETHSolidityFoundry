//SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

contract SimpleStorage {
    uint256 number;

    function store(uint256 _number) public {
        number = _number;
    }

    function retrieve() public view returns (uint256) {
        return number;
    }

    struct Person {
        string name;
        uint256 age;
    }

    Person public abc = Person("Inv1nc", 20);

    Person[] public persons;

    mapping(string => uint256) public nameToAge;

    function addPerson(string memory _name, uint256 _age) public {
        Person memory newPerson = Person(_name, _age);
        persons.push(newPerson);
        nameToAge[_name] = _age;
    }
}
