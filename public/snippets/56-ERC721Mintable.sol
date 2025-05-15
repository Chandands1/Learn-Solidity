// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

/// @title ERC721Mintable - NFT with token URI
contract ERC721Mintable is ERC721URIStorage {
    uint public tokenId;

    constructor() ERC721("MintableNFT", "MNFT") {}

    /// @notice Mints a new NFT with metadata URI
    function mint(string memory _uri) public {
        _mint(msg.sender, tokenId);
        _setTokenURI(tokenId, _uri);
        tokenId++;
    }
}
