# Checkpoints

Checkpoints for bitcoin-based blockchains. Bitcoin, Dash, Litecoin, BitcoinCash

## Requirements

* Xcode 15.4+
* Swift 5.10+
* iOS 14.0+

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/sunimp/Checkpoints.git", .upToNextMajor(from: "1.0.0"))
]
```
## Usage

```swift
let checkpoints = try CheckpointData(blockchain: .dash, network: .main, blockType: .last)
checkpoints.block // main block data
checkpoints.additionalBlocks // additional blocks data
```
