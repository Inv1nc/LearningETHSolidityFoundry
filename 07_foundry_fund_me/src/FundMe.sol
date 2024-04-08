// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {PriceConvertor} from "./PriceConvertor.sol";
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

error FundMe_NotOwner();

contract FundMe {
    address private immutable owner;
    AggregatorV3Interface public s_priceFeed;
    constructor(address priceFeed) {
        owner = msg.sender;
        s_priceFeed = AggregatorV3Interface(priceFeed);
    }

    uint256 public constant MINIMUM_USD = 5 * 10 ** 18;

    using PriceConvertor for uint256;

    address[] private funders;
    mapping(address=>uint256) private addressToAmount;
    function fund() payable public {
        require(msg.value.getConversionRate(s_priceFeed) > MINIMUM_USD, "atleast 5 usd.");
        funders.push(msg.sender);
        addressToAmount[msg.sender] += msg.value;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner, "You are not owner.");
        _;
    }

    function cheaperWithdraw() public onlyOwner {
        uint256 funderLength = funders.length;
        for(uint256 funderIndex = 0; funderIndex < funderLength; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmount[funder] = 0;
        }
        funders = new address[](0);
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success);
    }

    function withdraw() public onlyOwner {
        for(uint256 funderIndex = 0; funderIndex<funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmount[funder] = 0;
        }
        funders = new address[](0);
        // Transfer vs call vs sender

        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success);
    }


    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }

    function getVersion() public view returns(uint256) {
        return s_priceFeed.version();
    }

    function getAmountFromAddress(address amountAddress) view external  returns(uint256) {
        return addressToAmount[amountAddress];
    }

    function getFunders(uint256 index) view external returns(address) {
        return funders[index];
    }

    function getOwner() view external returns(address) {
        return owner;
    }
}

