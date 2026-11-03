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
            url: "https://sdk-download.meetinglawyers.com/ios/sdk/2.2.2-alpha01/MeetingLawyers_2.2.2-alpha01.zip",
            checksum: "fff87f5ae09b52a477603a7c4933ca1231e3b419569140cfaf6f27b655f09dea"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "https://sdk-download.meetinglawyers.com/ios/nse-sdk/2.2.2-alpha01/MeetingLawyersNSE_2.2.2-alpha01.zip",
            checksum: "109c8e87ad7d21eb6016f2d89ce92b5d38482c07abe57b030e2bb870284a8e15"
        ),
        .binaryTarget(
            name: "MeetingLawyersCore",
            url: "https://sdk-download.meetinglawyers.com/ios/core-sdk/2.2.2-alpha01/MeetingLawyersCore_2.2.2-alpha01.zip",
            checksum: "fc06d5d311d394a4cfefe13c7aca72332aafb702a0e078bb5f9ea1e2a4260595"
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
