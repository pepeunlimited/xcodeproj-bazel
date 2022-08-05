#
#  BUILD
#
#  Copyright 2022 Pepe Unlimited
#  Licensed under the MIT license, see associated LICENSE file for terms.
#  See AUTHORS file for the list of project authors.
#

load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application"
)

load("@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
)

# REQUIRED
# Define entry point for the iOS application.
# objc bridges application for .swift files.
#
# @see this connect Application.swift for iOS application
objc_library(
    name = "Main",
    srcs = [
        "main.m"
    ],
)

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
# NOTICE: AppDelegate.swift is optional if you're
# targeting greater than 13.0 iOS version
swift_library(
    name = "Lib",
    srcs = glob([
        "SceneDelegate.swift",
        "AppDelegate.swift",
        "OSLog+extension.swift",
    ]),
    visibility = ["//visibility:public"]
)

# REQUIRED
# The iOS application
#
# NOTICE: launch_storyboard is must be set or othwerise
# it causes bug for frame.size for application
ios_application(
    name = "HelloWorld",
    deps = [":Main", ":MainSwift", ":Lib"],
    bundle_id = "com.pepeunlimited.helloworld",
    families = [
        "iphone",
        "ipad"
    ],
    infoplists = ["Info.plist"],
    launch_storyboard = "LaunchScreen.storyboard",
    resources = [],
    minimum_os_version = "12.0",
    visibility = ["//visibility:public"]
)
