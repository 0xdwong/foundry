// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console, stdMath} from "forge-std/Test.sol";
import {Arithmetic} from "../src/Arithmetic.sol";

contract ArithmeticTest is Test {
    Arithmetic public arithmetic;

    uint256[] public fixtureX = [1, 5, 555];

    function setUp() public {
        arithmetic = new Arithmetic();
    }

    function test_add() public {
        uint256 ten = stdMath.abs(-10);

        uint256 result = arithmetic.add(1, ten);
        assertEq(result, 11);
    }

    function testFuzz_addOne(uint256 x) public {
        vm.assume(x < type(uint256).max);
        uint256 result = arithmetic.addOne(x);
        assertEq(result, x + 1, "addOne");
    }
}
