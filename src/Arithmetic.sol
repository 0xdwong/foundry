// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Arithmetic {
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function addOne(uint256 a) public pure returns (uint256) {
        return a + 1;
    }
}
