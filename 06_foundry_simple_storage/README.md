## Installation using Foundryup

Foundryup is the Foundry toolchain installer. You can find more about it [here](https://github.com/foundry-rs/foundry/blob/master/foundryup/README.md).  

Open your terminal and run the following command:  

```bash
curl -L https://foundry.paradigm.xyz | bash
```

## Creating a New Project

To start a new project with Foundry, use ```forge init```:   

```bash
forge init 06_foundry_simple_storage
```

This creates a new directory ```06_foundry_simple_storage``` from the default template. This also intialize a new ```git``` repository.  

Let's build the project:  

```bash
$ forge build
[⠒] Compiling...
[⠒] Compiling 27 files with 0.8.25
[⠢] Solc 0.8.25 finished in 2.89s
Compiler run successful!
```

## Run Script

```bash
$ forge script script/DeploySimpleStorage.s.sol 
[⠒] Compiling...
[⠃] Compiling 1 files with 0.8.25
[⠊] Solc 0.8.25 finished in 2.70s
Compiler run successful!
Script ran successfully.
Gas used: 385965

== Return ==
0: contract SimpleStorage 0x90193C961A926261B756D1E5bb255e67ff9498A1

If you wish to simulate on-chain transactions pass a RPC URL.
```
## Deploy on any network using CLI

```bash
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0x00...
```


## Interactive with our Contract

```cast``` is used Perform Ethereum RPC calls from the command line.  

```cast send``` - sign and publish a transaction.

```shell
cast send $CONTRACT_ADDRESS "FUNCTION_NAME(ARGTYPE)" arg --rpc-url $RPC_URL --private-key $PRIVATE_KEY
```

```cast call``` - perform a call on an account without publishing a transaction.

```shell
cast call $CONTRACT_ADDRESS "FUNCTION_NAME()"
```

```cat --to-base```  - converts a number of one base to another.

```shell
cast --to-base 0x0000... dec
```
