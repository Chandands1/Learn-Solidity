// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract BlockInspector{
    uint256 public lastBlockNumber;
    uint256 public lastBlocTimestamp;
    address public lastCaller;
    uint256 public lastGasLeft;

    function recoredBlock() public{
        lastBlockNumber = block.number;
        lastBlocTimestamp = block.timestamp;
        lastCaller = msg.sender;
        lastGasLeft = gasleft();
    }
    function getCurrentBlockInfo() public view returns(
        uint256 number,
        uint256 timestamp,
        uint256 hasLimit,
        uint256 baseFee,
        address coinbase,
        uint256 chainid

    ){
        return(
            block.number,
            block.timestamp,
            block.gaslimit,
            block.basefee,
            block.coinbase,
            block.chainid
        );
    }
}