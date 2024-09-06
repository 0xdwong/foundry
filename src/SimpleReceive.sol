// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleReceive {
    event Receive(address indexed sender, uint256 value);

    constructor() {}

    receive() external payable {
        emit Receive(msg.sender, msg.value);
    }
}
