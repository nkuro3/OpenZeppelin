// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import '@openzeppelin/contracts/access/Ownable.sol';

contract GameItem is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("GameItem", "ITM") {}

    // Base URI
    string private _baseURIextended;

    // Optional mapping for token URIs
    mapping (uint256 => string) private _tokenURIs;

    function awardItem(address player, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        // If solidity < 0.8.0, _setTokenURI is prepared by ownself.
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }


    function setBaseURI(string memory baseURI_) external onlyOwner() {
        _baseURIextended = baseURI_;
    }

    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721Metadata: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }
    
}

// ref
// https://docs.openzeppelin.com/contracts/3.x/erc721#constructing_an_erc721_token_contract
// https://ethereum.stackexchange.com/questions/93917/function-settokenuri-in-erc721-is-gone-in-openzeppelin-0-8-0-contracts