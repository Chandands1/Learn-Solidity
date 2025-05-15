// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SimpleAuction - Basic highest-bid-wins auction

contract SimpleAuction {
    address public highestBidder;
    uint public highestBid;
    mapping(address => uint) public bids;

    function bid() public payable {
        require(msg.value > highestBid, "Bid too low");

        if (highestBidder != address(0)) {
            bids[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
    }

    function withdraw() public {
        uint amount = bids[msg.sender];
        require(amount > 0, "Nothing to withdraw");
        bids[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
