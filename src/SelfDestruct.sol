// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelfDestructExample {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function killSelf(address receiver) public {
        require(msg.sender == owner, "Only owner can call this function");
        selfdestruct(payable(receiver));
    }

    // 函数处理发送到合约的以太
    receive() external payable {}
}
