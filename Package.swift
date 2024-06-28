// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXCoreModule_SD_Offline_Database",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXCoreModule_SD_Offline_Database",
			targets: ["GXCoreModule_SD_Offline_DatabaseWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "2.1.0-rc.25"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayerLocal.git", exact: "2.1.0-rc.25")
	],
	targets: [
		.target(name: "GXCoreModule_SD_Offline_DatabaseWrapper",
				dependencies: [
					"GXCoreModule_SD_Offline_Database",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS])),
					.product(name: "GXDataLayerLocal", package: "GXDataLayerLocal", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXCoreModule_SD_Offline_Database",
			url: "https://pkgs.genexus.dev/iOS/preview/GXCoreModule_SD_Offline_Database-2.1.0-rc.25.xcframework.zip",
			checksum: "d7de5f465458b9cf02f47bf73ab8003c7bbfa081118b3378b9eb4be0a5b00378"
		)
	]
)