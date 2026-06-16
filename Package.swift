// swift-tools-version: 6.0

/* Native */
import PackageDescription

// MARK: - Package

let package = Package(
    name: "ComponentKit",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "ComponentKit",
            targets: ["ComponentKit"]
        ),
    ],
    targets: [
        .target(
            name: "ComponentKit",
            dependencies: [],
            path: "Sources",
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
    ]
)
