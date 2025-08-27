// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeetinglawyersSDK",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "MeetingLawyers",
            targets: ["MeetingLawyersWrapper"]),
        .library(
            name: "MeetingLawyersNSE",
            targets: ["MeetingLawyersNSE"]),
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
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/sdk/2.0.9/MeetingLawyers_2.0.9.zip",
            checksum: "e9981832fe12b9c268daeeb6bddcd07aae2817f24fbe8c6cf2a523b8c9c02677"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/nse-sdk/2.0.9/MeetingLawyersNSE_2.0.9.zip",
            checksum: "33e27ccfeb6d81fe025e34f6012682705e90ce1544f07a6d9f5d5121689bb8a9"
        ),
        .target(
            name: "MeetingLawyersWrapper",
            dependencies: [
                "MeetingLawyers",
                .product(name: "SocketIO", package: "socket.io-client-swift"),
                .product(name: "TUSKit", package: "TUSKit"),
            ]
        ),
    ]
)