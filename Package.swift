// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DearSwift",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v15)
    ],
    products: [
        .library(name: "DearSwift", targets: ["DearSwift"]),
    ],
    targets: [
        .target(name: "DearSwift"),
        .testTarget(name: "DearSwiftTests", dependencies: ["DearSwift"]),
        .testTarget(name: "DearSwiftPerformance", dependencies: ["DearSwift"]),
    ]
)
