// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Application",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
        .package(path: "../Model"),
        .package(path: "../ModelExtensions"),
        .package(path: "../Serialization")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Application",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Model", package: "Model"),
                .product(name: "ModelExtensions", package: "ModelExtensions"),
                .product(name: "Serialization", package: "Serialization")
            ]
        ),
    ]
)
