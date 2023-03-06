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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", branch: "beta"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayerLocal.git", branch: "beta")
	],
	targets: [
		.target(name: "GXCoreModule_SD_Offline_DatabaseWrapper",
				dependencies: [
					"GXCoreModule_SD_Offline_Database",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.watchOS, .iOS, .tvOS])),
					.product(name: "GXDataLayerLocal", package: "GXDataLayerLocal", condition: .when(platforms: [.watchOS, .iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXCoreModule_SD_Offline_Database",
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreModule_SD_Offline_Database-1.0.0-beta+20230306150353.xcframework.zip",
			checksum: "a8cb6af0ec5bc0859de2660a358c11d9b6d4d50e45a57ce3be8c885e8fecd24a"
		)
	]
)