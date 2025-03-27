// ~/c/bamw/bamware-swiftui/BamwareMessaging/Package.swift
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "BamwareMessaging",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "BamwareMessaging", targets: ["BamwareMessaging"])
    ],
    dependencies: [
        .package(url: "https://github.com/mrbam88/BamwareCore.git",  branch: "main"),
        .package(url: "https://github.com/mrbam88/BamwareUI.git",  branch: "main")
    ],
    targets: [
        .target(
            name: "BamwareMessaging",
            dependencies: ["BamwareCore", "BamwareUI"]
        ),
        .testTarget(
            name: "BamwareMessagingTests",
            dependencies: ["BamwareMessaging"]
        )
    ]
)
