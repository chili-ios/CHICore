// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CHICore",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "CHICore",
            targets: ["CHICore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Ekhoo/Device.git", .upToNextMajor(from: "3.0.0" )),
    ],
    targets: [
        .target(
            name: "CHICore",
            dependencies: [
                "Device"
            ],
            path: "CHICore/Classes"
        ),
        .testTarget(
            name: "CHICoreTests",
            dependencies: ["CHICore"]),
    ]
)
