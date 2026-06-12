// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Flake",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(name: "NIODemoServer", targets: ["NIODemoServer"]),
        .executable(name: "NIODemoClient", targets: ["NIODemoClient"]),
        .executable(name: "Example", targets: ["Example"]),
        .library(
            name: "Flake",
            targets: ["Flake"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
      .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0"),
      .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.6.0"),
      .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
      .package(url: "https://github.com/apple/swift-metrics.git", from: "1.0.0"),
      .package(url: "https://gitlab.com/mordil/swift-redi-stack.git", from: "1.0.0-alpha.5")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Flake",
            dependencies: ["Service", "Server", "Client"]),
        .target(
          name: "Service",
          dependencies: []),
        .target(
          name: "Server",
          dependencies: []),
        .target(
          name: "Client",
          dependencies: []),
        .target(
          name: "Transport",
          dependencies: []),
        .target(
          name: "Codec",
          dependencies: []),
        .target(
          name: "Slector",
          dependencies: []),
        .target(
          name: "Registry",
          dependencies: []),
        .target(
          name: "Broker",
          dependencies: []),
        .target(name: "Example",
                dependencies: ["NIO"]),
        .target(name: "NIODemoServer",
                dependencies: ["NIO", "NIOConcurrencyHelpers"]),
        .target(name: "NIODemoClient",
                dependencies: ["NIO", "NIOConcurrencyHelpers"]),
        .testTarget(
            name: "FlakeTests",
            dependencies: ["Flake"]),
        
    ]
)
