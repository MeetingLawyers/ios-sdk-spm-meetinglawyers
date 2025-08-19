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
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/sdk/2.0.7/MeetingLawyers_2.0.7.zip",
            checksum: "a8e3f5bb7ef45445fa321ecc1c5625b905bdc43b0786785fe46a1e190cde39e8"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/nse-sdk/2.0.7/MeetingLawyersNSE_2.0.7.zip",
            checksum: "f5137414542328d7342fe6172b91063e7afeb5300bc5c4deb626d1dda9e13c08"
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