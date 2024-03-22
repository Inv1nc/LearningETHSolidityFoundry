// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10; // solidity versions

contract SimpleStorageV2 {
    uint256 myFavNum; // 0

    struct Person{
        uint256 favNum;
        string name;
    }

    // Dynamic Array
    Person[] public listofPeople;

    // key value is mapped to a value
    mapping(string => uint256) public nametoFavNum;

    function addPerson(uint256 _favNum, string memory _name) public{
        Person memory newPerson = Person({favNum: _favNum, name: _name});
        listofPeople.push(newPerson);
        nametoFavNum[_name] = _favNum;  
    }    
}
