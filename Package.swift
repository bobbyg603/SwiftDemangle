// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftDemangle",
    platforms: [
        .macOS(SupportedPlatform.MacOSVersion.v11),
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftDemangle",
            targets: ["SwiftDemangle"]),
        .library(name: "SwiftDemangleFramework",
                 targets: ["SwiftDemangleFramework"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftDemangle",
            dependencies: [],
            cSettings: [.define("ENABLE_BITCODE=YES")],
            cxxSettings: [.define("ENABLE_BITCODE=YES")],
            swiftSettings: [.define("ENABLE_BITCODE=YES")]
        ),
        .testTarget(
            name: "SwiftDemangleTests",
            dependencies: ["SwiftDemangle"]),
        .binaryTarget(name: "SwiftDemangleFramework",
                      path: "Binary/SwiftDemangle.xcframework"),
    ],
    swiftLanguageVersions: [.v5]
)
