// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {PriceConvertor} from "./PriceConvertor.sol";


contract Fundme {
    address public immutable owner;
    constructor() {
        owner = msg.sender;
    }
    using PriceConvertor for uint256;
    uint256 public constant MINIMUM_USD = 10;

    address[] public funders;
    mapping(address=>uint256) public addressToAmountFunded;

    function fund() public payable {
        require(msg.value.getConversionRate() > MINIMUM_USD,"alteast 10 wei");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() onlyOwner public {
        // for loop
        for (uint256 funderIndex=0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // transfer
        // send
        // call

    // bool sendSucess = payable(msg.sender).send(address(this).balance);
    // payable(msg.sender).transfer(address(this).balance);
    // call
    // (bool sendSuccess, ) = payable(msg.sender).call{value: address(this).balance}()
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Sender is not Owner");
        _;
    }

    receive() external payable {
        fund();
     }

     fallback() external payable {
        fund();
     }
}
