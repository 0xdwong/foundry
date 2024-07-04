# Foundry


## 安装
Foundryup 是 Foundry 工具链安装程序

安装：`curl -L https://foundry.paradigm.xyz | bash`

升级：`foundryup`


## 使用

Build

```shell
$ forge build
```

测试

```shell
$ forge test
```

格式化

```shell
$ forge fmt
```

Gas Snapshots

```shell
$ forge snapshot
```

Anvil

```shell
$ anvil
```

部署

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

Cast

```shell
$ cast <subcommand>
```


## 参考
- [foundry book](https://book.getfoundry.sh/)
