Follow the steps below to reproduce on Remix:

1. Deploy the `NFTReentrancy` contract.
2. Deploy the `Attack` contract with the `NFTReentrancy` contract address as the parameter.
3. Call the `attack()` function of the `Attack` contract to initiate the attack.
4. Call the `balanceOf()` function of the `NFTReentrancy` contract to check the holdings of the `Attack` contract. You will see that it holds `10` NFTs, indicating a successful attack.

![](https://raw.githubusercontent.com/remix-project-org/remix-workshops/master/NFTReentrancy/img/S16-2.png)
