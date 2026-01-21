// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OracleMock {
    uint256 public price;

    function setPrice(uint256 _price) external {
        price = _price;
    }

    function getPrice() external view returns (uint256) {
        return price;
    }
}
