# CoffeeChain

CoffeeChain is a project for Udacity's Blockchain Engineer Nanodegree. It is a coffee supply chain dapp.

## Project Feedback

![Review](images/review1.png?raw=true)

![Review](images/review2.png?raw=true)

## Libraries

truffle-hdwallet-provider: Used to sign transactions for addresses derived from a 12 or 24 word mnemonic.

truffle: Facilitates dapp development. Used to compile, migrate, test and deploy smart contracts.

web3: Collection of libaries to interact with Ethereum locally or remotely. Allows for easy work with the blockchain.


## Contracts on Rinkeby Testnet


### FarmerRole
``` 
Contract Address: 0x33Ba88b2cE9661D9512db9055e97C530d98C4b78

TxID: 0xe233c22935e994c7c9ffff6f5e53ab6ad6f0ba64243b8c68d17ce2e5fce6d24a
```

### DistributorRole
```
Contract Address: 0x79f63bbd4151Cc7a6B6EFE27f4777B5579257F99

TxID: 0x88410aa688c46f9bc248b7a96a02c55a12c95725e818f4532fdb621ec49ff633
```

### RetailerRole
```
Contract Address: 0x5911cBe262bee07FDBA0B639733C80E99B2978D9

TxID: 0xb32d08ef548f3cf24a17ed103c364f9c09987776cea7954132c27b414cc4b887
```

### ConsumerRole
```
Contract Address: 0x87A3Ab0cE91dE714aC12e647FA15a8183a29DD26

TxID: 0x4b78fc6bdde01eef265b17f8f9a702a854d807c126bac2ac11429eb6e3f551b1
```

### SupplyChain
```
Contract Address: 0xe74CA8c103C76E56a629AB21F4aa854Bb2342836

TxID: 0xa3af2b1c456b921f2bfe928ea875916fe189b5cf6e552e4bdc01006f72a23cf9
```

## Versions

### Node version

v10.9.0


### Truffle verion

v5.4.5


### web3 version

web3@1.2.1


## UML Diagrams

### Activity

![Activity](diagrams/activityDiagram.png?raw=true "Activity")


### State

![State](diagrams/stateDiagram.png?raw=true "State")


### Sequence

![Sequence](diagrams/sequenceDiagram.png?raw=true "Sequence")


### Class

![Class](diagrams/classDiagram.png?raw=true "Class")




## Running and Testing

### Prerequisites

Please make sure you've already installed ganache-cli, truffle and enabled MetaMask extension in your browser.


### Installing

A step by step series of examples that tell you have to get a development env running

Change directory to `project` folder and install all requisite npm packages:

```
cd project
npm install
```

### Running

Launch Ganache:

```
ganache-cli -m "spirit supply whale amount human item harsh scare congress discover talent hamster"
```

In a separate terminal window, Compile smart contracts:

```
truffle compile
```

This will create the smart contract artifacts in folder ```build\contracts```.

Migrate smart contracts to the locally running blockchain, ganache-cli:

```
truffle migrate
```


Test smart contracts:

```
truffle test
```

All 10 tests should pass.


In a separate terminal window, launch the DApp:

```
npm run dev
```

The DApp User Interface when running should look like...

![UI](images/productOverview.png?raw=true)

![UI](images/farmDetails.png?raw=true)

![UI](images/productDetails.png?raw=true)


### Testing and Deploy

![truffle test](images/testsOutput.png?raw=true)

![rinkeby deploy](images/rinkebyDeploy1.png?raw=true)

![rinkeby deploy](images/rinkebyDeploy2.png?raw=true)


## Worklow
```
The workflow for the supply chain and the dapp is:

- A farmer account harvests the coffee, enters information and selects the `Harvest` button under Farm Details. Coffee state is now Harvested.
- The farmer processes the coffee and selects `Process`. Coffee state is now Processed.
- The farmer packs the coffee and selects `Packed`. Coffee state is now Packed.
- The farmer puts the coffee up for sale by selecting `ForSale`. Coffee state is now ForSale.
- A distributor account buys the coffee by selecting `Buy` under Product Details. Coffee state is now Sold.
- The distributor ships it to the retailer and selects `Ship`. Coffee state is now Shipped.
- The retailer marks it received by selecting `Receive`. Coffee state is now Received.
- The consumer purchases the coffee from the retailer by selecting `Purchase`. Coffee state is now Purchased.
- Information about a product can be fetched from the blockchain using the Product Overview fields by providing a upc. 
```