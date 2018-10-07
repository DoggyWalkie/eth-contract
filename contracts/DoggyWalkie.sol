pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol';


contract DoggyWalkie is ERC721Full, ERC721Mintable {


    // Mapping token hold to address (previous owner)
    mapping (uint256 => address) private _tokenHold;
    mapping (uint256 => uint256) private _tokenPrice;

    constructor() ERC721Full("DoggyWalkie", "DOGGY") public {
    }

    //all minters
    modifier onlyMinter() {
        _;
    }


    //no one can stop minting
    function finishMinting()
    public
    returns (bool)
    {
        return false;
    }

    function purchaseToken(uint256 tokenId)
    public
    payable
    returns (bool)
    {
        transferFrom(ownerOf(tokenId),msg.sender,tokenId);
    }


    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    )
    public payable
    {
        require(_exists(tokenId));
        require(_onHold(tokenId) != false);
        require(to != address(0));
        _removeTokenFrom(from, tokenId);
        _addTokenTo(to, tokenId);

        addToHold(tokenId,from, msg.value);
        emit Transfer(from, to, tokenId);
    }

    // send token to hold and collect token price
    function addToHold(uint256 tokenId, address from ,uint256 price){
        _tokenPrice[tokenId] = price;
        _tokenHold[tokenId] = from;

    }

    //confirm job - release the money (no fee fro this time)
    function confirmJob(uint256 tokenId){
        require(_onHold(tokenId));
        require(ownerOf(tokenId) == msg.sender);
        _tokenHold[tokenId].transfer(_tokenPrice[tokenId]);
        _tokenHold[tokenId] = address(0);//unhold token

    }


    //is token on hold
    function _onHold(uint256 tokenId) returns(bool){
        address owner = _tokenHold[tokenId];
        return owner != address(0);
    }


}