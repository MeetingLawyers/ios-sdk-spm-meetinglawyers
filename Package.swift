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
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/new-sdk/2.0.0-alpha42/MeetingLawyers_2.0.0-alpha42.zip",
            checksum: "14d25b7be636deda6e164b397be99cc3d8a4f21e1eb0d3c92027be114b9e3e79"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/nse-sdk/2.0.0-alpha42/MeetingLawyersNSE_2.0.0-alpha42.zip",
            checksum: "d70ee1119710122773d320ffd368f048c117627b87a646fb495b1645cecf6585"
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