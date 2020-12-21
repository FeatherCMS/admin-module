// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "admin-module",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "AdminModule", targets: ["AdminModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/binarybirds/feather-core", from: "1.0.0-beta"),

        /// drivers
//        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.0.0"),
//        .package(url: "https://github.com/binarybirds/liquid-local-driver", from: "1.2.0-beta"),
    ],
    targets: [
        .target(name: "AdminModule", dependencies: [
            .product(name: "FeatherCore", package: "feather-core"),
        ],
        resources: [
            .copy("Bundle"),
        ]),
//        @NOTE: https://bugs.swift.org/browse/SR-8658
//        .target(name: "Feather", dependencies: [
//            .product(name: "FeatherCore", package: "feather-core"),
//
//            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
//            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
//
//            .target(name: "AdminModule"),
//        ]),
        .testTarget(name: "AdminModuleTests", dependencies: [
            .target(name: "AdminModule"),
        ])
    ]
)
