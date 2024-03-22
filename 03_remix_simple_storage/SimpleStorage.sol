// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10; // solidity versions

contract SimpleStorage {
    // favouriteNumber gets intialized to 0 if no value if given
    
    uint256 favouriteNumber;

    function store(uint256 _favouriteNumber) virtual public{
        favouriteNumber = _favouriteNumber;
    }

    // view - Disallows modification of state
    function retrieve()  public view returns(uint256){
        return favouriteNumber;
    }
}
