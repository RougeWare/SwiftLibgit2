// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLibgit2",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftLibgit2",
            targets: ["SwiftLibgit2", "Initializer"]),
    ],
    dependencies: [
      .package(url: "https://github.com/bdewey/static-libgit2", from: "0.5.0"),
      .package(url: "https://github.com/apple/swift-log.git", from: "1.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftLibgit2",
            dependencies: [
              "static-libgit2",
              "Initializer",
              .product(name: "Logging", package: "swift-log"),
            ],
            swiftSettings: [
                .unsafeFlags(["-warnings-as-errors"]),
            ]
        ),
        .target(name: "Initializer", dependencies: ["static-libgit2"]),
        .testTarget(
            name: "SwiftLibgit2Tests",
            dependencies: ["SwiftLibgit2"],
            swiftSettings: [
              //        .unsafeFlags(["-warnings-as-errors"]),
            ]
        ),
    ]
)
