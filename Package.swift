// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-exponential",
    platforms: [.macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27)],
    products: [
        .library(name: "Exponential", targets: ["Exponential"]),
        .library(name: "Exponential Foundation Integration", targets: ["Exponential Foundation Integration"]),
        .library(name: "Exponential Test Support", targets: ["Exponential Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Exponential", dependencies: [], path: "Sources/Exponential"),
        .target(name: "Exponential Foundation Integration", dependencies: [.target(name: "Exponential")], path: "Sources/Exponential Foundation Integration"),
        .target(name: "Exponential Test Support", dependencies: [.target(name: "Exponential")], path: "Tests/Support"),
        .testTarget(name: "Exponential Tests", dependencies: [.target(name: "Exponential"), .target(name: "Exponential Test Support")], path: "Tests/Exponential Tests"),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}
