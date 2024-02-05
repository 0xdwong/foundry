// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MyERC20} from "../src/MyERC20.sol";

contract CounterTest is Test {
    MyERC20 public myERC20;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() public {
        myERC20 = new MyERC20(1 ether);
    }

    function test_name() public {
        assertEq(myERC20.name(), "MyERC20Token");
    }

    function test_symbol() public {
        assertEq(myERC20.symbol(), "MERC");
    }

    function test_decimals() public {
        assertEq(myERC20.decimals(), 18);
    }

    function test_totalSupply() public {
        assertEq(myERC20.totalSupply(), 1 ether);
    }

    function test_balanceOf() public {
        address deployMsgSender = address(this);
        assertEq(myERC20.balanceOf(deployMsgSender), 1 ether);
    }

    function test_transfer() public {
        address from = address(this);
        address to = address(1);
        uint256 amount = 0.1 ether;

        vm.prank(from);

        vm.expectEmit(true, true, true, true);
        emit Transfer(from, to, amount);

        myERC20.transfer(to, amount);

        vm.stopPrank();
    }
}
