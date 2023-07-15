// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXCoreModule_SD_Offline_Database",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXCoreModule_SD_Offline_Database",
			targets: ["GXCoreModule_SD_Offline_DatabaseWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.0.0-preview.20230715000002"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayerLocal.git", exact: "1.0.0-preview.20230715000002")
	],
	targets: [
		.target(name: "GXCoreModule_SD_Offline_DatabaseWrapper",
				dependencies: [
					"GXCoreModule_SD_Offline_Database",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.tvOS, .watchOS, .iOS])),
					.product(name: "GXDataLayerLocal", package: "GXDataLayerLocal", condition: .when(platforms: [.tvOS, .watchOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXCoreModule_SD_Offline_Database",
			url: "https://pkgs.genexus.dev/iOS/preview/GXCoreModule_SD_Offline_Database-1.0.0-preview.20230715000002.xcframework.zip",
			checksum: "b36fdf23f10b2940a2b6268c7874d7e9053173e065646acddcc03695be6c4a1e"
		)
	]
)