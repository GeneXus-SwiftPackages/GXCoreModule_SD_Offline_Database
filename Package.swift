// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXCoreModule_SD_Offline_Database",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXCoreModule_SD_Offline_Database",
			targets: ["GXCoreModule_SD_Offline_DatabaseWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "3.2.0-rc.13"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayerLocal.git", exact: "3.2.0-rc.13")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXCoreModule_SD_Offline_Database-3.2.0-rc.13.xcframework.zip",
			checksum: "2867273603f41228f38cc49217cf9d2e3d6526ffd15f578312a2e854452ea4ed"
		)
	]
)