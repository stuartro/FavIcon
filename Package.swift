// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
   name: "FavIcon",
   
   platforms: [
      .macOS(.v10_11)
   ],
   
   products: [
      .library(
         name: "FavIconLib",
         targets: ["FavIconLib"]),
      
      .executable(
         name: "favicon",
         targets: ["favicon"]),
   ],
   
   dependencies: [
      .package(url: "https://github.com/apple/swift-argument-parser", from: "0.1.0"),
   ],
   
   targets: [
      .target(
         name: "FavIconLib",
         dependencies: []),
      
      .target(name: "favicon",
              dependencies: ["ArgumentParser", "FavIconLib"]),
      
      .testTarget(
         name: "FavIconLibTests",
         dependencies: ["FavIconLib"]),
   ]
)

