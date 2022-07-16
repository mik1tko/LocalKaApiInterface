// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "LocalKaApiInterface",
  platforms: [
    .macOS(.v12)
  ],
  products: [
    .library(name: "LocalKaApiInterface", targets: ["LocalKaApiInterface"])
  ],
  dependencies: [
    // 💧 A server-side Swift web framework.
    .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
  ],
  targets: [
    .target(
      name: "LocalKaApiInterface", 
      dependencies: [
        .product(name: "Vapor", package: "vapor")
      ]
    )
  ]
)
