import XCTest
import WWExtensions
@testable import Checkpoints

final class TestParseData: XCTestCase {

    func testBitcoinMainBip44() throws {
        let bitcoinBip44 = "02000000ba3f2b4208ec0495b2e3743465cae2b44d8f1c778b44cf6b0000000000000000d287e52e8045c060c1cee47d1cc7559c7b8ab8db580539fb55fc579a998ea14efe0e50538c9d001926c0c180a08504003f72e59e0db5b38e5210369dc2fb4831ab1e81f3b5dbec3d0000000000000000"

        let checkpoints = try! CheckpointData(blockchain: .bitcoin, network: .main, blockType: .bip44)
        XCTAssertEqual(bitcoinBip44, checkpoints.block.ww.hex)
    }

    func testDashMainBip44AdditionalBlocks() throws {
        let dashAddBlock0 = "02000000adcce9364a714874a1afb2a24d423a2e0a3655c0c0f28250d10f8e0000000000034c43a7dbfc6e8bed9dceb8ed88cec72478741e6184b96bbf628b6e732178bb84f911533449011cab2a1c0087650000fa029e39ca627f2b2d4140b5825e48f254ba3f3fa411d3e2c2641b0000000000"
        let dashAddBlock1 = "0200000022dfb410c8d52af4b4daf60b9e6b9333c4a3fed79156083744080300000000008d105952fd0b550e9522f3fe55a304a7c0cf386298f11e1441d98965a32a69cbf2f81153de64011cca876f0086650000adcce9364a714874a1afb2a24d423a2e0a3655c0c0f28250d10f8e0000000000"

        let checkpoints = try! CheckpointData(blockchain: .dash, network: .main, blockType: .bip44)

        XCTAssertEqual(dashAddBlock0, checkpoints.additionalBlocks[0].ww.hex)
        XCTAssertEqual(dashAddBlock1, checkpoints.additionalBlocks[1].ww.hex)
    }

}
