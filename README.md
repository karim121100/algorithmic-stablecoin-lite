# Algorithmic Stablecoin Lite

This repository implements a professional-grade, educational version of a Seigniorage Algorithmic Stablecoin. It utilizes a dual-token ecosystem to maintain a peg to a target value (e.g., $1.00) without 1:1 collateralization.

### The Ecosystem
* **StableToken (CUSD):** The asset intended to stay at $1.00.
* **ShareToken (CSHARE):** The governance and value-capture token that receives seigniorage when the price is above peg.
* **Treasury:** The central logic that calculates price deviations and triggers expansions or contractions.

### Mechanism
1.  **Expansion:** If CUSD > $1.00, the Treasury mints new CUSD and distributes it to CSHARE holders.
2.  **Contraction:** If CUSD < $1.00, the protocol incentivizes burning CUSD to reduce supply (simplified for this repo via a "Burn-for-Priority" logic).



### Security
* **Time-weighted Average Price (TWAP):** Prevents flash-loan manipulation of the peg.
* **Epoch-based Rebasing:** Adjustments only happen in discrete time intervals.
