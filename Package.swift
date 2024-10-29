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
            from: "16.1.0"
        ),
        .package(
            url: "https://github.com/tus/TusKit.git", 
            from: "3.3.0"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "MeetingLawyers",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/new-sdk/2.0.0-beta02/MeetingLawyers_2.0.0-beta02.zip",
            checksum: "c97dec4c18c1422351788f22dee9b126e3fa6a3f2aab99f41055f404d75655ac"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/nse-sdk/2.0.0-beta02/MeetingLawyersNSE_2.0.0-beta02.zip",
            checksum: "58aa94c4f5b985b91a499ef227cd9aae7ad91ac62dbf82fbbd8a7e6f0ce3c32d"
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