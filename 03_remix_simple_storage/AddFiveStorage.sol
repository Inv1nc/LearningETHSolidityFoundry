//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    function sayHello() public pure returns(string memory) {
        return "Hello";
    }

    // +5
    // override
    // virtual override

    function store(uint256 _favnum) public override{
        favouriteNumber = _favnum + 5;
    }
}
