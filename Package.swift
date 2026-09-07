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
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/sdk/2.2.0-alpha06/MeetingLawyers_2.2.0-alpha06.zip",
            checksum: "76914ef40aa7e91f5fac67748b8dc158051de0f1dd9fabad70603e016ed8b98d"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/nse-sdk/2.2.0-alpha06/MeetingLawyersNSE_2.2.0-alpha06.zip",
            checksum: "3a93832a1d55b69c7c27ce1f197790b9eda6e9ba98b7f840fb3dbad501ff6d61"
        ),
        .binaryTarget(
            name: "MeetingLawyersCore",
            url: "https://meetinglawyers-ios-sdk.s3.eu-west-3.amazonaws.com/core-sdk/2.2.0-alpha06/MeetingLawyersCore_2.2.0-alpha06.zip",
            checksum: "517928a93ebc245ec6b7d3f767f1fc95ff7569873932bab0ea75bb594c8f9d9d"
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
