// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {SelfDestructExample} from "../src/SelfDestruct.sol";

contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // 部署合约
        bytes32 _salt = bytes32("hello world");

        new SelfDestructExample{salt: _salt}();

        vm.stopBroadcast();
    }
}
