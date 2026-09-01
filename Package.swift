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
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/sdk/2.2.0-alpha02/MeetingLawyers_2.2.0-alpha02.zip",
            checksum: "8ce9383240ffed62ae98e6e8ef9c61d8196602655cb7a0db91dc84e581c3268b"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/nse-sdk/2.2.0-alpha02/MeetingLawyersNSE_2.2.0-alpha02.zip",
            checksum: "b3a89c60f732428acf66dcb8153a75af8cbad60e3dd5e73f5c956460ec7c4a1e"
        ),
        .binaryTarget(
            name: "MeetingLawyersCore",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/core-sdk/2.2.0-alpha02/MeetingLawyersCore_2.2.0-alpha02.zip",
            checksum: "50704893d4b88cbea76786f51da238b8983d86e23d78b0fe72efefcc3ac7d2e0"
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
