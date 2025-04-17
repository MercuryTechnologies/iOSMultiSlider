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
    targets: [
        .target(name: "MultiSlider", path: "Sources"),
    ],
    swiftLanguageVersions: [.v5]
)
