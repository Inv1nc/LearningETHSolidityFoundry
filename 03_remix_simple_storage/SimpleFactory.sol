// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listofSimpleStorageContracts;
    // address[] public listofSimpleStorageContracts;

    function createSimpleStorage() public {
        SimpleStorage newsimpleStorageContract = new SimpleStorage();
        listofSimpleStorageContracts.push(newsimpleStorageContract);
    }

    function sfStorage(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNum) public {
        SimpleStorage mySimpleStorage = listofSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNum);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listofSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}   
