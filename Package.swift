// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlamofireSwiftyJSON",
    platforms: [
        .iOS(.v15),
        .tvOS(.v13),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "AlamofireSwiftyJSON",
            targets: ["AlamofireSwiftyJSON"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.0")

    ],
    targets: [
        .target(
            name: "AlamofireSwiftyJSON",
            dependencies: ["Alamofire", "SwiftyJSON"],
            path: "Source"
        ),
        .testTarget(
            name: "AlamofireSwiftyJSONTests",
            dependencies: ["AlamofireSwiftyJSON"]
        )
    ]
)
