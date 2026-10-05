// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeetinglawyersSDK",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "MeetingLawyers",
            targets: ["MeetingLawyersWrapper"]),
        .library(
            name: "MeetingLawyersNSE",
            targets: [
                "MeetingLawyersNSE",
                "MeetingLawyersCore",
            ]),
        .library(
            name: "MeetingLawyersCore",
            targets: ["MeetingLawyersCore"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/socketio/socket.io-client-swift.git", 
            from: "16.1.1"
        ),
        .package(
            url: "https://github.com/tus/TusKit.git", 
            from: "3.4.1"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "MeetingLawyers",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/sdk/2.2.0/MeetingLawyers_2.2.0.zip",
            checksum: "ffb7ea5f0d877e584cf4def15dfd8f4a230ccaf0c1c50da25d4958c3bb3b78cc"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/nse-sdk/2.2.0/MeetingLawyersNSE_2.2.0.zip",
            checksum: "7fe1d4e813475a7a2f86a198ea54a4b21577d817fa1d913be3b82aaf23b0f543"
        ),
        .binaryTarget(
            name: "MeetingLawyersCore",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/core-sdk/2.2.0/MeetingLawyersCore_2.2.0.zip",
            checksum: "11e4b6297ed5ad9d3fcbe75d8f810457294849442080c1e470531abaaaa51582"
        ),
        .target(
            name: "MeetingLawyersWrapper",
            dependencies: [
                "MeetingLawyers",
                "MeetingLawyersCore",
                .product(name: "SocketIO", package: "socket.io-client-swift"),
                .product(name: "TUSKit", package: "TUSKit"),
            ]
        ),
    ]
)
