In this lesson, we will discuss the reentrancy vulnerability in NFT contracts and attack a vulnerable NFT contract to mint 100 NFTs.

## NFT Reentrancy Risk

In [S01 Reentrancy Attack](https://github.com/AmazingAng/WTF-Solidity/blob/main/Languages/en/S01_ReentrancyAttack_en/readme.md), we discussed that reentrancy attack is one of the most common attacks in smart contracts, where an attacker exploits contract vulnerabilities (e.g., `fallback` function) to repeatedly call the contract and transfer assets or mint a large number of tokens. When transferring NFTs, the contract's `fallback` or `receive` functions are not triggered. So why is there a reentrancy risk?

This is because the NFT standards ([ERC721](https://github.com/AmazingAng/WTF-Solidity/blob/main/Languages/en/34_ERC721_en/readme.md)/[ERC1155](https://github.com/AmazingAng/WTF-Solidity/blob/main/Languages/en/40_ERC1155_en/readme.md)) have introduced secure transfers to prevent users from accidentally sending assets to a black hole. If the recipient address is a contract, it will call the corresponding check function to ensure that it is ready to receive the NFT asset. For example, the `safeTransferFrom()` function of ERC721 calls the `onERC721Received()` function of the target address, and a hacker can embed malicious code in it to launch an attack.

We have summarized the functions in ERC721 and ERC1155 that have potential reentrancy risks:

![](https://raw.githubusercontent.com/remix-project-org/remix-workshops/master/NFTReentrancy/img/S16-1.png)
