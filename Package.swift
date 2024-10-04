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
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/new-sdk/2.0.0-alpha49/MeetingLawyers_2.0.0-alpha49.zip",
            checksum: "b80f6a9c29f0254dbd25ae8c5b4a7f8ea9b1c63104605f717f4e91f58be743ec"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/nse-sdk/2.0.0-alpha49/MeetingLawyersNSE_2.0.0-alpha49.zip",
            checksum: "6e5ad5136644a250f3617976deb1c1ec44ef5049825b0daba3f2982849a8e0c8"
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