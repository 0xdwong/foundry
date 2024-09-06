# Foundry


## 安装
Foundryup 是 Foundry 工具链安装程序

安装：`curl -L https://foundry.paradigm.xyz | bash`

升级：`foundryup`


## 使用
### forge

- Build： `$ forge build`

- 测试：`$ forge test`

- 格式化：`forge fmt`

- Gas Snapshots：`forge snapshot`

- 验证合约

    eg: 
    ```
    forge verify-contract \
    <contract> src/xx.sol:xxx \
    --chain sepolia \
    --etherscan-api-key sepolia \
    --rpc-url sepolia
    ```


- 部署

    eg:
    ```
    forge script \
    script/Counter.s.sol:CounterScript \
    --rpc-url <your_rpc_url> \
    --private-key <your_private_key>\
    --broadcast \
    -vvvvv
    ```

    也可以把配置写到`.env`和`foundry.toml`文件  
    ```
    forge script \
    script/SelfDestruct.s.sol:DeployScript \
    --rpc-url sepolia \
    --verify --etherscan-api-key sepolia \
    --broadcast \
    -vvvvv
    ```


### Anvil
启动本地节点：`anvil`


### Cast
与链上合约交互

eg:
```
cast call \
<contract>  "owner()(address)"  \
--rpc-url sepolia
```


## 参考
- [foundry book](https://book.getfoundry.sh/)
