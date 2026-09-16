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
                // CORE-BEGIN
                "MeetingLawyersCore",
                // CORE-END
            ]),
        // CORE-BEGIN
        .library(
            name: "MeetingLawyersCore",
            targets: ["MeetingLawyersCore"]),
        // CORE-END
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
            url: "{{MEETINGLAWYERS_URL}}",
            checksum: "{{MEETINGLAWYERS_CHECKSUM}}"
        ),
        .binaryTarget(
            name: "MeetingLawyersNSE",
            url: "{{MEETINGLAWYERSNSE_URL}}",
            checksum: "{{MEETINGLAWYERSNSE_CHECKSUM}}"
        ),
        // CORE-BEGIN
        .binaryTarget(
            name: "MeetingLawyersCore",
            url: "{{MEETINGLAWYERSCORE_URL}}",
            checksum: "{{MEETINGLAWYERSCORE_CHECKSUM}}"
        ),
        // CORE-END
        .target(
            name: "MeetingLawyersWrapper",
            dependencies: [
                "MeetingLawyers",
                // CORE-BEGIN
                "MeetingLawyersCore",
                // CORE-END
                .product(name: "SocketIO", package: "socket.io-client-swift"),
                .product(name: "TUSKit", package: "TUSKit"),
            ]
        ),
    ]
)
