// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "MyLibrary",
    products: [
        .library(
            name: "MyLibrary",
            type: .dynamic, // dylib を出力
            targets: ["MyLibrary"]
        ),
    ],
    targets: [
        .target(
            name: "MyLibrary",
            dependencies: []
        ),
    ]
)
