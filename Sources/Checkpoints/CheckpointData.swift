//
//  CheckpointData.swift
//  Checkpoints
//
//  Created by Sun on 2024/8/21.
//

import Foundation

import WWExtensions

public class CheckpointData {
    
    public let block: Data
    public let additionalBlocks: [Data]

    public init(blockchain: Blockchain, network: Network, blockType: BlockType) throws {
        let resourcePath = [network.rawValue, blockType.rawValue].joined(separator: "-")
        let subdirectory = ["Assets", blockchain.rawValue].joined(separator: "/")
        guard let checkpoint = Bundle.module.url(forResource: resourcePath, withExtension: "checkpoint", subdirectory: subdirectory) else {
            throw ParseError.invalidUrl
        }

        let string = try String(contentsOf: checkpoint, encoding: .utf8)
        var lines = string.components(separatedBy: .newlines).filter { !$0.isEmpty }

        guard !lines.isEmpty else {
            throw ParseError.invalidFile
        }

        guard let block = lines.removeFirst().ww.hexData else {
            throw ParseError.invalidFile
        }
        self.block = block

        var additionalBlocks = [Data]()
        for line in lines {
            guard let additionalData = line.ww.hexData else {
                throw ParseError.invalidFile
            }
            additionalBlocks.append(additionalData)
        }
        self.additionalBlocks = additionalBlocks
    }

}

extension CheckpointData {

    public enum Blockchain: String {
        case bitcoin = "Bitcoin"
        case bitcoinCash = "BitcoinCash"
        case dash = "Dash"
        case litecoin = "Litecoin"
        case eCash = "ECash"
    }

    public enum Network: String {
        case main = "MainNet"
        case test = "TestNet"
    }

    public enum BlockType: String {
        case bip44 = "bip44"
        case last = "last"
    }

    public enum ParseError: Error {
        case invalidUrl
        case invalidFile
    }
}
