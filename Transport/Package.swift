// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Transport",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TransportHome",
            targets: ["TransportHome"]),
        
            .library(
                name: "TransportHomeImp",
                targets: ["TransportHomeImp"]),
        
    ],
    dependencies: [
        .package(name: "ModernRIBs", url: "https://github.com/DevYeom/ModernRIBs", .exact("1.0.1")),
        .package(path: "../Finance"),
        .package(path: "../Platform")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TransportHome",
            dependencies: [
                "ModernRIBs"]),
        
            .target(
                name: "TransportHomeImp",
                dependencies: [
                    "TransportHome",
                    "ModernRIBs",
                    .product(name: "FinanceRepository", package: "Finance"),
                    .product(name: "Topup", package: "Finance"),
                    .product(name: "SuperUI", package: "Platform")
                ],
                
                resources: [
                    .process("Resources")]),
    ]
)
