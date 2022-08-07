#
#  BUILD
#
#  Copyright 2022 Pepe Unlimited
#  Licensed under the MIT license, see associated LICENSE file for terms.
#  See AUTHORS file for the list of project authors.
#

load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
)

load("@build_bazel_rules_apple//apple:versioning.bzl",
     "apple_bundle_version",
)

load("@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
)

## MARK: objc_library

# REQUIRED
# Define entry point for the iOS application.
# objc bridges application for AppDelegate.swift and
# Application.swift files.
objc_library(
    name = "Main",
    srcs = [
        "main.m"
    ],
)

## MARK: swift_library

# REQUIRED
swift_library(
    name = "MainSwift",
    srcs = glob([
        "Application.swift",
    ]),
    visibility = ["//visibility:private"]
)

# REQUIRED
# Define iOS .swift files
#
# AppDelegate.swift is optional if you're targeting greater than 13.0 iOS version
# Remember change at main.h AppDelegate.swift with SceneDelegate.swift
swift_library(
    name = "Lib",
    srcs = glob([
        "SceneDelegate.swift",
        "AppDelegate.swift",
        "OSLog+extension.swift",
    ]),
    visibility = ["//visibility:public"]
)

## OPTIONAL
# Environment Variables
helloworld_env = {
  "VARIABLE_1": "Something1",
  "VARIABLE_2": "Something2",
}

## MARK: apple_bundle_version

# REQUIRED
apple_bundle_version(
    name = "simple",
    build_version = "1.0.0",
    short_version_string = "1",
)

## REQUIRED
# The iOS application.
# deps attach reference for:
#   - main.m :Main
#   - Application.swift :MainSwift
#   - SceneDelegate.swift, (AppDelegate.swift optional) and OSLog+extension.swift :Lib
ios_application(
    name = "HelloWorld",
    deps = [":Main", ":MainSwift", ":Lib"],
    bundle_id = "com.pepeunlimited.helloworld",
    families = [
        "iphone",
        "ipad"
    ],
    infoplists = [
        "Info.plist",
    ],
    launch_storyboard = "LaunchScreen.storyboard",
    resources = [],
    minimum_os_version = "12.0",
#    env = helloworld_env,
    bundle_name = "HelloWorld",
    version = ":simple",
    visibility = ["//visibility:public"]
)
