// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view{
        string 
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cHM6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjUwIiBoZWlnaHQ9IjI1MCI+PHRleHQgZmlsbD0iYmxhY2siPiBoaWkgeW91IGRlY29kZSB0aGlzIDwvdGV4dD48L3N2Zz4=";
        string 
            memory actualUri = deployer.svgToImageURI(string(vm.readFile("./images/example.svg")));
        assert(
            keccak256(abi.encodePacked(expectedUri)) ==
                keccak256(abi.encodePacked(actualUri))
        );
    }

}