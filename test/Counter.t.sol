// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testSendEeh() public {
        deal(address(1), 1000);
        assertEq(address(1).balance, 1000);

        // vm.prank(address(1));

        // payable(address(2)).transfer(100);
        // console.log("balance1", address(1).balance);
        // console.log("balance2", address(2).balance);
        // assertEq(address(1).balance, 900);

        hoax(address(1), 1000);
        payable(address(2)).transfer(100);
        assertEq(address(1).balance, 900);
        assertEq(address(2).balance, 100);
    }

    function testFuzz(uint256 x) public {
        assertEq(x >= 0, true);

        vm.assume(x > 2 ** 128);
        assertEq(x <= 2 ** 128, false);

        x = bound(x, 1, 100);
        console.log("=====x=======:", x);
        assertGe(x, 1);
        assertLe(x, 100);
    }
}
