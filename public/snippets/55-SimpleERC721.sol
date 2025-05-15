// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/// @title SimpleERC721 - A basic NFT (ERC721) example
contract SimpleERC721 is ERC721 {
    uint public tokenCounter;

    constructor() ERC721("SimpleNFT", "SNFT") {
        tokenCounter = 0;
    }

    /// @notice Mints a new NFT to the caller
    function mint() public {
        _mint(msg.sender, tokenCounter);
        tokenCounter++;
    }
}
