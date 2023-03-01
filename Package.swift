// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SwiftAvroReader",
    products: [
        .library(
            name: "SwiftAvroReader",
            targets: ["SwiftAvroReader"]),
    ],
    dependencies: [
        .package(url: "https://github.com/STCData/SwiftAvroCore", branch: "master") 
        
    ],
    targets: [
        .target(
            name: "SwiftAvroReader",
            dependencies: ["SwiftAvroCore"]),
        .testTarget(
            name: "SwiftAvroReaderTests",
            dependencies: ["SwiftAvroReader"]),
    ]
)
