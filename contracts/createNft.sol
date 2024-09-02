// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.24;

contract OykNft {
    string public name = "Ozgur Yazilim Kampi ns NFT Collection";
    string public symbol = "NS";

    mapping(address => uint256) public balanceOf;
    mapping(uint256 => address) public ownerOf;
    mapping(uint256 => string) private _tokenURIs;

    uint256 public totalSupply;

    function mint(address to, uint256 tokenId, string memory _tokenURI) public {
        ownerOf[tokenId] = to;
        balanceOf[to] += 1;
        totalSupply += 1;
        _tokenURIs[tokenId] = _tokenURI;
    }

    function transferFrom(address from, address to, uint256 tokenId) public {
        require(ownerOf[tokenId] == from, "this is not your NFT");
        ownerOf[tokenId] = to;
        balanceOf[from] -= 1;
        balanceOf[to] += 1;
    }

}