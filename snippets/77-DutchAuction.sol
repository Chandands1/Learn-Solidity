// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title DutchAuction - Price decreases over time

contract DutchAuction {
    uint public startPrice;
    uint public discountRate;
    uint public startTime;
    address public seller;
    bool public sold;

    constructor(uint _startPrice, uint _discountRate) {
        seller = msg.sender;
        startPrice = _startPrice;
        discountRate = _discountRate;
        startTime = block.timestamp;
    }

    function getPrice() public view returns (uint) {
        uint discount = (block.timestamp - startTime) * discountRate;
        if (discount >= startPrice) return 0;
        return startPrice - discount;
    }

    function buy() public payable {
        require(!sold, "Already sold");
        uint price = getPrice();
        require(msg.value >= price, "Insufficient ETH");

        sold = true;
        payable(seller).transfer(price);

        if (msg.value > price) {
            payable(msg.sender).transfer(msg.value - price); // refund extra
        }
    }
}
