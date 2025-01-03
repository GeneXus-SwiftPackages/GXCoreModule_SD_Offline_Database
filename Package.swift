// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXCoreModule_SD_Offline_Database",
	platforms: [.iOS("13.0"), .watchOS("9.0"), .tvOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXCoreModule_SD_Offline_Database",
			targets: ["GXCoreModule_SD_Offline_DatabaseWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "2.2.0-beta.30"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayerLocal.git", exact: "2.2.0-beta.30")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXCoreModule_SD_Offline_Database-2.2.0-beta.30.xcframework.zip",
			checksum: "92e9dbe2fc8731399d77cc675aebcc0bfb92395d15d7ec1191034e90510d7c8f"
		)
	]
)