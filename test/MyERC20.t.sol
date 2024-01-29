// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MyERC20} from "../src/MyERC20.sol";

contract CounterTest is Test {
    MyERC20 public myERC20;

    function setUp() public {
        myERC20 = new MyERC20(100000000);
    }

    function test_Name() public {
        assertEq(myERC20.name(), "MyERC20Token");
    }
}
