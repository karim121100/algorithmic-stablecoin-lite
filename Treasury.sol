// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./StableToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Treasury is Ownable {
    StableToken public stable;
    uint256 public constant TARGET_PRICE = 1e18; // $1.00
    
    event Expansion(uint256 amount);

    constructor(address _stable) Ownable(msg.sender) {
        stable = StableToken(_stable);
    }

    function allocateSeigniorage(uint256 currentPrice) external onlyOwner {
        if (currentPrice > TARGET_PRICE) {
            uint256 percentage = ((currentPrice - TARGET_PRICE) * 100) / TARGET_PRICE;
            uint256 supplyToAdd = (stable.totalSupply() * percentage) / 100;
            stable.mint(owner(), supplyToAdd); // In production, this goes to Share Stakers
            emit Expansion(supplyToAdd);
        }
    }
}
