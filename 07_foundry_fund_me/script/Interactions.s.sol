// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract  FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.1 ether;
    function fundFundMe(address mostRecentlyDeployedAddress) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentlyDeployedAddress)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("Funded Fundme with %s", SEND_VALUE);
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
        fundFundMe(mostRecentlyDeployed);
    }
}



contract  WithDrawFundMe is Script {
    uint256 constant SEND_VALUE = 0.1 ether;
    function withdrawFundMe(address mostRecentlyDeployedAddress) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentlyDeployedAddress)).withdraw();
        vm.stopBroadcast();
        console.log("Funded Fundme with %s", SEND_VALUE);
    }
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
        withdrawFundMe(mostRecentlyDeployed);
    }
}
