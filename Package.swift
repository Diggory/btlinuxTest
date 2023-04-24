// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "btlinuxTest",

	platforms: [
		.macOS(.v10_15),
	],

	/*
	 If we try and use a tagged release then we get the following error:
	 
	 .package(url: "https://github.com/PureSwift/BluetoothLinux.git", from: "5.0.0")

	 Failed to resolve dependencies Dependencies could not be resolved because package 'bluetoothlinux' is required using a stable-version but 'bluetoothlinux' depends on an unstable-version package 'socket' and root depends on 'bluetoothlinux' 5.0.0..<6.0.0.

	 But if we use the 'master' branch then the build fails with errors because the Socket API has changed:
	 
	 .package(url: "https://github.com/PureSwift/BluetoothLinux.git", branch: "master")

	 /Users/diggory/Library/Developer/Xcode/DerivedData/btlinuxTest-eomvgxpbsjcwyrbrstovbcqxxnej/SourcePackages/checkouts/BluetoothLinux/Sources/BluetoothLinux/L2CAP/L2CAPSocket.swift:217:26 'Event' is not a member type of struct 'Socket.Socket'
	 
	 /Users/diggory/Library/Developer/Xcode/DerivedData/btlinuxTest-eomvgxpbsjcwyrbrstovbcqxxnej/SourcePackages/checkouts/BluetoothLinux/Sources/BluetoothLinux/L2CAP/L2CAPSocket.swift:145:83 Extra argument 'sleep' in call

	 

	 */
	
	dependencies: [
		.package(url: "https://github.com/PureSwift/BluetoothLinux.git", branch: "master")
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "btlinuxTest",
			dependencies: [
				.product(name: "BluetoothLinux", package: "BluetoothLinux"),
			],
            path: "Sources"),
    ]
)
