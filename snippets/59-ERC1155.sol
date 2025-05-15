// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

/// @title ERC1155Token - Example of a multi-token standard
contract ERC1155Token is ERC1155 {
    constructor() ERC1155("https://api.example.com/metadata/{id}.json") {}

    /// @notice Mints tokens of multiple IDs
    function mint(address _to, uint _id, uint _amount) public {
        _mint(_to, _id, _amount, "");
    }

    /// @notice Batch mint
    function mintBatch(address _to, uint[] memory _ids, uint[] memory _amounts) public {
        _mintBatch(_to, _ids, _amounts, "");
    }
}
