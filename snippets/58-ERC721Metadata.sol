// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

/// @title ERC721Metadata - NFT with metadata support
contract ERC721Metadata is ERC721URIStorage {
    uint public tokenCount;

    constructor() ERC721("MetadataNFT", "MDNFT") {}

    /// @notice Mints a token with a URI
    function mintWithMetadata(string memory _uri) public {
        _mint(msg.sender, tokenCount);
        _setTokenURI(tokenCount, _uri);
        tokenCount++;
    }

    /// @notice Returns metadata URI
    function getTokenURI(uint _id) public view returns (string memory) {
        return tokenURI(_id);
    }
}
