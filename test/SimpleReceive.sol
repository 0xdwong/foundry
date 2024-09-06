// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {SimpleReceive} from "../src/SimpleReceive.sol";

contract TestContract is Test {
    SimpleReceive public instance;

    function setUp() public {
        instance = new SimpleReceive();
    }

    function testFuzz_shold_emit_receive_when_receive(uint256 value) public {
        vm.deal(address(this), value);

        vm.expectEmit(true, true, true, true);
        emit SimpleReceive.Receive(address(this), value);

        (bool success,) = address(instance).call{value: value}("");

        require(success, "send ether to target contract failed");

        assertEq(address(instance).balance, value);
    }
}
