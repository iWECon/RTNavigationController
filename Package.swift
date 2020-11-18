// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RTNavigationController",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "RTNavigationController",
            targets: ["RTNavigationController"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "RTNavigationController",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "RTNavigationControllerTests",
            dependencies: ["RTNavigationController"]),
    ]
)
