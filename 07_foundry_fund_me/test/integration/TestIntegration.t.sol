//SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe} from "../../script/Interactions.s.sol";
import {WithDrawFundMe} from "../../script/Interactions.s.sol";

contract FundTestIntegration is Test {

    address USER = makeAddr("inv1nc");
    uint256 constant SEND_VALUE = 0.1 ether;
    uint256 constant STARTING_BALANCE = 10 ether;
    FundMe fundMe;

    function setUp() external{
            DeployFundMe deploy = new DeployFundMe();
            fundMe = deploy.run();
            vm.deal(USER, STARTING_BALANCE);
    }

    function testUserCanFundAndOwnerWithdraw() public {
        FundFundMe fundFundMe = new FundFundMe();
        fundFundMe.fundFundMe(address(fundMe));

        WithDrawFundMe withdrawFundMe = new WithDrawFundMe();
        withdrawFundMe.withdrawFundMe(address(fundMe));
        
        assert(address(fundMe).balance == 0); 
    }
}