// SPDX-License-Identifier: UNLICENSED
// DecentAPI - 2023
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract OliveOilQualityAssurance is ERC721 {
    uint256 public nextTokenId;
    
    struct OliveOilBatch {
        string producer;
        uint256 harvestDate;
        string originCountry;
        string productionProcess;
        string labAnalysisResults;
        // more fields to be added
    }
    
    mapping(uint256 => OliveOilBatch) public batches;
    
    constructor() ERC721("OliveOilQualityAssurance", "OOQA") {
        nextTokenId = 1;
    }
    
    function mintOliveOilBatch(
        string memory producer,
        uint256 harvestDate,
        string memory originCountry,
        string memory productionProcess,
        string memory labAnalysisResults
    ) external {
        uint256 tokenId = nextTokenId;
        _safeMint(msg.sender, tokenId);
        
        OliveOilBatch storage newBatch = batches[tokenId];
        newBatch.producer = producer;
        newBatch.harvestDate = harvestDate;
        newBatch.originCountry = originCountry;
        newBatch.productionProcess = productionProcess;
        newBatch.labAnalysisResults = labAnalysisResults;
        
        nextTokenId++;
    }
    
    function transferOliveOilBatch(uint256 tokenId, address to) external {
        require(ownerOf(tokenId) == msg.sender, "You are not the owner of this batch");
        safeTransferFrom(msg.sender, to, tokenId);
    }
    
    function totalSupply() external view returns (uint256) {
        return nextTokenId - 1;
    }
}
