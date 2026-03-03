Now let's learn an example of an NFT contract with a reentrancy vulnerability. This is an `ERC721` contract where each address can mint one NFT for free, but we can exploit the reentrancy vulnerability to mint multiple NFTs at once.

### Vulnerable Contract

The `NFTReentrancy` contract inherits from the `ERC721` contract. It has two main state variables: `totalSupply` to track the total supply of NFTs and `mintedAddress` to keep track of addresses that have already been minted to prevent a user from minting multiple times. It has two main functions:

- Constructor: Initializes the name and symbol of the `ERC721` NFT.
- `mint()`: Mint function where each user can mint one NFT for free. **Note: This function has a reentrancy vulnerability!**
