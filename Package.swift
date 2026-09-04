// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

// The marked regions below are kept only when the release publishes MeetingLawyersCore; the
// workflow strips them otherwise. Marker lines must stay as bare full-line comments.

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
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/sdk/2.2.0-alpha05/MeetingLawyers_2.2.0-alpha05.zip",
            checksum: "1960779000a2cb74b76afe9c2c03de6da02461d70db4edefb2a6af3de7ef4814"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/nse-sdk/2.2.0-alpha05/MeetingLawyersNSE_2.2.0-alpha05.zip",
            checksum: "f7392020289e3b5906f169231b21054dda5e48792594bad65255381217afaa69"
        ),
        .binaryTarget(
            name: "MeetingLawyersCore",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/core-sdk/2.2.0-alpha05/MeetingLawyersCore_2.2.0-alpha05.zip",
            checksum: "629f0847fc7299a2a1b50ff32597f19a4c8f6659466bfec2af6850e0c93db9f5"
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
