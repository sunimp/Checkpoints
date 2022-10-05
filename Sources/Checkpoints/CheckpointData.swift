import Foundation
import HsExtensions

public class CheckpointData {
    public let block: Data
    public let additionalBlocks: [Data]

    public init(blockchain: Blockchain, network: Network, blockType: BlockType) throws {
        let path = [network.rawValue, blockType.rawValue].joined(separator: "-")
        guard let checkpoint = Bundle.module.url(forResource: path, withExtension: "checkpoint", subdirectory: blockchain.rawValue) else {
            throw ParseError.invalidUrl
        }

        let string = try String(contentsOf: checkpoint, encoding: .utf8)
        var lines = string.components(separatedBy: .newlines).filter { !$0.isEmpty }

        guard !lines.isEmpty else {
            throw ParseError.invalidFile
        }

        guard let block = lines.removeFirst().hs.hexData else {
            throw ParseError.invalidFile
        }
        self.block = block

        var additionalBlocks = [Data]()
        for line in lines {
            guard let additionalData = line.hs.hexData else {
                throw ParseError.invalidFile
            }
            additionalBlocks.append(additionalData)
        }
        self.additionalBlocks = additionalBlocks
    }

}

public extension CheckpointData {

    enum Blockchain: String {
        case bitcoin = "Bitcoin"
        case bitcoinCash = "BitcoinCash"
        case dash = "Dash"
        case litecoin = "Litecoin"
    }

    enum Network: String {
        case main = "MainNet"
        case test = "TestNet"
    }

    enum BlockType: String {
        case bip44 = "bip44"
        case last = "last"
    }

    enum ParseError: Error {
        case invalidUrl
        case invalidFile
    }

}
