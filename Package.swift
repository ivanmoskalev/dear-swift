// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XnSwift",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v15)
    ],
    products: [
        .library(name: "XnSwift", targets: ["XnSwift"]),
    ],
    targets: [
        .target(name: "XnSwift"),
        .testTarget(name: "XnSwiftTests", dependencies: ["XnSwift"]),
        .testTarget(name: "XnSwiftPerformance", dependencies: ["XnSwift"]),
    ]
)
