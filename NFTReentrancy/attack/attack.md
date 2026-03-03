The reentrancy vulnerability in the `NFTReentrancy` contract lies in the `mint()` function, which calls the `_safeMint()` function in the `ERC721` contract, which in turn calls the `_checkOnERC721Received()` function of the recipient address. If the recipient address's `_checkOnERC721Received()` contains malicious code, an attack can be performed.

The `Attack` contract inherits the `IERC721Receiver` contract and has one state variable `nft` that stores the address of the vulnerable NFT contract. It has three functions:

- Constructor: Initializes the address of the vulnerable NFT contract.
- `attack()`: Attack function that calls the `mint()` function of the NFT contract and initiates the attack.
- `onERC721Received()`: ERC721 callback function with embedded malicious code that repeatedly calls the `mint()` function and mints 10 NFTs.