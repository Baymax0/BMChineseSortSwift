// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BMChineseSort",
    products: [
        .library(
            name: "BMChineseSort", targets: ["BMChineseSort"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "BMChineseSort", path: "Sources")
    ]
)
