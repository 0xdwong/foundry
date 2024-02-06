// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MyERC20} from "../src/MyERC20.sol";
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import {IERC20Errors} from "openzeppelin-contracts/contracts/interfaces/draft-IERC6093.sol";

contract CounterTest is Test {
    MyERC20 public myERC20;

    function setUp() public {
        myERC20 = new MyERC20(1 ether);
    }

    function testName() public {
        assertEq(myERC20.name(), "MyERC20Token");
    }

    function testSymbol() public {
        assertEq(myERC20.symbol(), "MERC");
    }

    function testDecimals() public {
        assertEq(myERC20.decimals(), 18);
    }

    function testTotalSupply() public {
        assertEq(myERC20.totalSupply(), 1 ether);
    }

    function testBalanceOf() public {
        address deployMsgSender = address(this);
        assertEq(myERC20.balanceOf(deployMsgSender), 1 ether);
    }

    // transfer() cases start
    function testTransfer() public {
        address sender = address(this);
        address receiver = address(1);
        uint256 amount = 10000;
        uint256 senderBlanceBefore = myERC20.balanceOf(sender);
        uint256 receiverBlanceBefore = myERC20.balanceOf(receiver);

        // emit Transfer event
        vm.expectEmit(true, true, true, true);
        emit IERC20.Transfer(sender, receiver, amount);

        // call transfer
        myERC20.transfer(receiver, amount);

        uint256 senderBlanceAfter = myERC20.balanceOf(sender);
        uint256 receiverBlanceAfter = myERC20.balanceOf(receiver);

        // check balance changes
        assertEq(senderBlanceBefore - amount, senderBlanceAfter);
        assertEq(receiverBlanceBefore + amount, receiverBlanceAfter);
    }

    function testTransferInsufficientBalanceRevert() public {
        address sender = address(2);
        address receiver = address(1);
        uint256 amount = 10000;
        uint256 senderBalance = myERC20.balanceOf(sender);  // balance: 0

        vm.expectRevert(
            abi.encodeWithSelector(IERC20Errors.ERC20InsufficientBalance.selector, sender, senderBalance, amount)
        );

        vm.prank(sender);
        myERC20.transfer(receiver, amount);
    }

    function testTransferInvalidSenderRevert() public {
        address sender = address(0);
        address receiver = address(1);
        uint256 amount = 10000;

        vm.expectRevert(
            abi.encodeWithSelector(IERC20Errors.ERC20InvalidSender.selector, sender)
        );

        vm.prank(sender);
        myERC20.transfer(receiver, amount);
    }

    function testTransferInvalidReceiverRevert() public {
        address receiver = address(0);
        uint256 amount = 10000;

        vm.expectRevert(
            abi.encodeWithSelector(IERC20Errors.ERC20InvalidReceiver.selector, receiver)
        );

        myERC20.transfer(receiver, amount);
    }
    // transfer() cases end
}
