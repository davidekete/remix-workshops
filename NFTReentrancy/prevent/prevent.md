There are two main methods to prevent reentrancy attack vulnerabilities: checks-effects-interactions pattern and reentrant guard.

1. Checks-Effects-Interactions Pattern: This pattern emphasizes checking the state variables, updating the state variables (e.g., balances), and then interacting with other contracts. We can use this pattern to fix the vulnerable `mint()` function:

```solidity
  function mint() payable external {
      // Check if already minted
      require(mintedAddress[msg.sender] == false);
      // Increase total supply
      totalSupply++;
      // Record the minted address
      mintedAddress[msg.sender] = true;
      // Mint the NFT
      _safeMint(msg.sender, totalSupply);
  }
```

2. Reentrant Lock: It is a modifier used to prevent reentrant functions. It is recommended to use [ReentrancyGuard](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/security/ReentrancyGuard.sol) provided by OpenZeppelin.

## Summary

In this lesson, we introduced the reentrancy vulnerability in NFTs and attacked a vulnerable NFT contract by minting 100 NFTs. Currently, there are two main methods to prevent reentrancy attacks: the checks-effects-interactions pattern and the reentrant lock.
