# Checkpoints

Checkpoints for bitcoin-based blockchains. Bitcoin, Dash, Litecoin, BitcoinCash

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code
and is integrated into the `swift` compiler. It is in early development, but DashCryptoKit does support its use on
supported platforms.

Once you have your Swift package set up, adding DashCryptoKit as a dependency is as easy as adding it to
the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/sunimp/Checkpoints.git", .upToNextMajor(from: "1.1.1"))
]
```
## Usage

```swift
let checkpoints = try CheckpointData(blockchain: .dash, network: .main, blockType: .last)
checkpoints.block // main block data
checkpoints.additionalBlocks // additional blocks data
```
