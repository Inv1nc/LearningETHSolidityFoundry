//SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

// storage is stored in the proxy, NOT in the implementation

// PROXY -> deploy implementation -> call some "initializer" function.

contract BoxV1 is  Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;    

    constructor() {
        _disableInitializers();
    }

    // proxy -> implementation

    function initialize() public initializer {
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
    }

    function getNumber() external view returns(uint256) {
        return number;
    }

    function version() external pure returns(uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}