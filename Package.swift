// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "MultiSlider",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(name: "MultiSlider", targets: ["MultiSlider"]),
    ],
    dependencies: [
        .package(url: "https://github.com/yonat/SweeterSwift", from: "1.0.4"),
    ],
    targets: [
        .target(name: "MultiSlider", dependencies: ["SweeterSwift"], path: "Sources"),
    ],
    swiftLanguageVersions: [.v5]
)
