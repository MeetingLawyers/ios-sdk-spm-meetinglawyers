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
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/sdk/2.2.1/MeetingLawyers_2.2.1.zip",
            checksum: "f1801d5f475014a41b1088eedc74bb6567295b98b6a9b2544158d321daa7351f"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/nse-sdk/2.2.1/MeetingLawyersNSE_2.2.1.zip",
            checksum: "5836039fcd60934b6ab4d1ec314f091d104b92efce80ff1b67af2c82dd632714"
        ),
        .binaryTarget(
            name: "MeetingLawyersCore",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/core-sdk/2.2.1/MeetingLawyersCore_2.2.1.zip",
            checksum: "4f75a7320a5307bf259db74c67fff2d5fcd5b347cca43b5ea36ae2a6d38f9861"
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
