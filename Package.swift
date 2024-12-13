// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-ogg",
    products: [
        .library(
            name: "Ogg",
            targets: ["COgg"]
        ),
    ],
    targets: [
        .target(
            name: "COgg",
            sources: [
                "./ogg/src/bitwise.c",
                "./ogg/src/framing.c",
            ]
        ),
        .executableTarget(
            name: "BitwiseTests",
            path: "Tests/BitwiseTests",
            cSettings: [
                .headerSearchPath("../../Sources/COgg/ogg/include"),
                .headerSearchPath("../../Sources/COgg/ogg/src"),
                .define("_V_SELFTEST"),
                .unsafeFlags(["-Wno-shorten-64-to-32"]),
            ]
        ),
        .executableTarget(
            name: "FramingTests",
            path: "Tests/FramingTests",
            cSettings: [
                .headerSearchPath("../../Sources/COgg/ogg/include"),
                .headerSearchPath("../../Sources/COgg/ogg/src"),
                .define("_V_SELFTEST"),
                .unsafeFlags(["-Wno-shorten-64-to-32"]),
            ]
        ),
    ]
)
