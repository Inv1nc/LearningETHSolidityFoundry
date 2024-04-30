// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";

contract BasicNftTest is Test {
    
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("Inv1nc"); 
    string public constant  PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() view external {
        string memory expectedName = "cat";
        string memory actualName = basicNft.name();
        assert(keccak256(bytes(actualName)) == keccak256(abi.encodePacked(expectedName)));
    }
    
    function testSymbolisCorrect() view external {
        string memory expectedSymbol = "meow";
        string memory actualName = basicNft.symbol();
        assertEq(actualName, expectedSymbol);
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft(PUG);
        assert(basicNft.balanceOf(USER) == 1);
        assert(keccak256(bytes(PUG)) == keccak256(bytes(basicNft.tokenURI(0))));
    }
}