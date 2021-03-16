// swift-tools-version:5.3
import PackageDescription

let isLocalTestMode = false

var deps: [Package.Dependency] = [
    .package(url: "https://github.com/FeatherCMS/feather-core", from: "1.0.0-beta"),
]

var targets: [Target] = [
    .target(name: "AdminModule", dependencies: [
        .product(name: "FeatherCore", package: "feather-core"),
    ],
    resources: [
        .copy("Bundle"),
    ]),
]

// @NOTE: https://bugs.swift.org/browse/SR-8658
if isLocalTestMode {
    deps.append(contentsOf: [
        /// drivers
        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.0.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver", from: "1.2.0"),
        /// core modules
        .package(url: "https://github.com/FeatherCMS/system-module", from: "1.0.0-beta"),
        .package(url: "https://github.com/FeatherCMS/common-module", from: "1.0.0-beta"),
        .package(url: "https://github.com/FeatherCMS/user-module", from: "1.0.0-beta"),
        .package(url: "https://github.com/FeatherCMS/api-module", from: "1.0.0-beta"),
        .package(url: "https://github.com/FeatherCMS/frontend-module", from: "1.0.0-beta"),
    ])
    targets.append(contentsOf: [
        .target(name: "Feather", dependencies: [
            .product(name: "FeatherCore", package: "feather-core"),
            /// drivers
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
            /// core modules
            .product(name: "SystemModule", package: "system-module"),
            .product(name: "CommonModule", package: "common-module"),
            .product(name: "UserModule", package: "user-module"),
            .product(name: "ApiModule", package: "api-module"),
            .product(name: "FrontendModule", package: "frontend-module"),

            .target(name: "AdminModule"),
        ]),
        .testTarget(name: "AdminModuleTests", dependencies: [
            .target(name: "AdminModule"),
        ])
    ])
}

let package = Package(
    name: "admin-module",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "AdminModule", targets: ["AdminModule"]),
    ],
    dependencies: deps,
    targets: targets
)
