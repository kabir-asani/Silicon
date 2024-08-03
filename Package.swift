// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "Silicon",
	platforms: [
		.iOS(.v12)
	],
    products: [
        .library(
            name: "Silicon",
            targets: ["Silicon"]
		),
    ],
    targets: [
        .target(
            name: "Silicon"
		),
        .testTarget(
            name: "SiliconTests",
            dependencies: ["Silicon"]
		),
    ]
)
