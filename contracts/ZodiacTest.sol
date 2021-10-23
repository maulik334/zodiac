// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ZodiacTest is ERC721, Ownable {
    uint256 public tokenCounter;
    uint256 public maxToken = 2;
    // address public owner;
    uint256 public randomPrice = 0.05 ether;
    uint256 public selectedPrice = 0.15 ether;

    constructor() public ERC721("DrawingTest", "DRW") {
        tokenCounter = 0;
        // owner = msg.sender;
    }

    function randomMintPrice() external view returns (uint256){
        return randomPrice;
    }

    function selectedMintPrice() external view returns (uint256){
        return selectedPrice;
    }

    function getMaxToken() external view returns (uint256){
        return maxToken;
    }

    
    function randomMint(string memory tokenURI)  public payable returns (uint256)
    {
        require(maxToken > tokenCounter ,'Maximum number item has been minted');
        require(msg.value >= randomPrice, 'Value below random nft minting price');
        
        tokenCounter = tokenCounter + 1;
        uint256 newItemId = tokenCounter;
        
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        
        return newItemId;
    }

    function mintToSelected(string memory tokenURI) public payable returns (uint256)
    {
        require(maxToken > tokenCounter ,'Maximum number item has been minted');
        // require(msg.value >= selectedPrice, '');
        require(msg.value >= selectedPrice, 'Value below selected nft minting price');

        tokenCounter = tokenCounter + 1;
        uint256 newItemId = tokenCounter;

        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function withdraw() public payable onlyOwner() {
        require(payable(msg.sender).send(address(this).balance));
    }

    function setmaxToken(uint256 _maxTokenValue) public onlyOwner() {
        maxToken = _maxTokenValue;
    }

    function setRandomPrice(uint256 _randomPrice) public onlyOwner {
        randomPrice = _randomPrice;
    }

    function setSelectedPrice(uint256 _selectedPrice) public onlyOwner {
        selectedPrice = _selectedPrice;
    }

    // internal
    // function _baseURI() internal view virtual override returns (string memory) {
    //     return baseURI;
    // }
    
    // function setBaseURI(string memory _newBaseURI) public onlyOwner() {
    //     baseURI = _newBaseURI;
    // }

}
