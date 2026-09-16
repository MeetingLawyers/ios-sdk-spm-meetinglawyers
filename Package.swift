// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

// The marked regions below are kept only when the release publishes MeetingLawyersCore; the
// workflow strips them otherwise. Marker lines must stay as bare full-line comments.

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
            ]),
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
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/sdk/2.1.2/MeetingLawyers_2.1.2.zip",
            checksum: "5c6052d5fc5e28daa75d406503e15a80771c38311cc90f6864650b3d86e907c6"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/nse-sdk/2.1.2/MeetingLawyersNSE_2.1.2.zip",
            checksum: "b1237b4f510de702980556d6f52a3493fa9c8b520cace541d14a44ba862aa493"
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
