// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

/// @title ERC721Enumerable - NFT that tracks all tokens
contract ERC721EnumerableToken is ERC721Enumerable {
    uint public currentId;

    constructor() ERC721("EnumerableNFT", "ENFT") {}

    /// @notice Mints a token and tracks it
    function mint() public {
        _mint(msg.sender, currentId);
        currentId++;
    }

    /// @notice Gets total minted NFTs
    function getTotalSupply() public view returns (uint) {
        return totalSupply();
    }

    /// @notice Returns token owned by user at index
    function tokenOfOwnerByIndexView(address owner, uint index) public view returns (uint) {
        return tokenOfOwnerByIndex(owner, index);
    }
}
