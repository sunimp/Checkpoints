// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Checkpoints",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "Checkpoints",
            targets: ["Checkpoints"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sunimp/WWExtensions.Swift.git", .upToNextMajor(from: "1.1.0")),
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.54.0"),
    ],
    targets: [
        .target(
            name: "Checkpoints",
            dependencies: [
                .product(name: "WWExtensions", package: "WWExtensions.Swift"),
            ],
            resources: [
                .copy("Assets")
            ]),
        .testTarget(
            name: "CheckpointTests",
            dependencies: [
                "Checkpoints",
                .product(name: "WWExtensions", package: "WWExtensions.Swift"),
            ]),
    ]
)
