#
#  BUILD
#
#  Copyright 2022 Pepe Unlimited
#  Licensed under the MIT license, see associated LICENSE file for terms.
#  See AUTHORS file for the list of project authors.
#

load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
    "ios_framework"
)

load("@build_bazel_rules_apple//apple:versioning.bzl",
     "apple_bundle_version",
)

load("@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
)

load("@build_bazel_rules_apple//apple:resources.bzl",
    "apple_resource_group"
)

load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:defs.bzl",
    "top_level_target",
    "xcodeproj",
)

# REQUIRED
########################
#### MARK: objc_library
########################

# Define entry point for the iOS application.
# objc bridges application for AppDelegate.swift and
# Application.swift files.
objc_library(
    name = "Main",
    srcs = [
        "Sources/main.m"
    ],
    visibility = ["//visibility:private"]
)

# REQUIRED
########################
#### MARK: swift_library
########################

swift_library(
    name = "MainSwift",
    srcs = glob([
        "Sources/Application.swift",
    ]),
    visibility = ["//visibility:private"]
)

# Define iOS .swift files
#
# NOTICE:
#   - AppDelegate.swift is optional if you're targeting greater
#   than 13.0 iOS version
#   - Remember change at main.h AppDelegate.swift with SceneDelegate.swift
#   - @see HelloWorldInfo.plist <key>UIApplicationSceneManifest</key>
swift_library(
    name = "Lib",
    srcs = glob([
        "Sources/*.swift"
    ]),
    deps = [
        "//submodules/SharedKit:SharedKit",
        "//submodules/OSExtension:OSExtension",
        "//submodules/UIKitExtension:UIKitExtension",
        "//submodules/HelloWorldUI:HelloWorldUI",
    ],
    visibility = ["//visibility:public"]
)

# OPTIONAL
################################
#### MARK: Environment Variables
################################

helloworld_env = {
  "VARIABLE_1": "Something1",
  "VARIABLE_2": "Something2",
}

# OPTIONAL
############################################################
#### MARK: Localizable (.strings for .plist and application)
############################################################

# English localizations

filegroup(
    name = "EnglishStrings",
    srcs = [
        "lprojs/en.lproj/Localizable.strings",
        "lprojs/en.lproj/InfoPlist.strings",
    ]
)

# Finnish localizations

filegroup(
    name = "FinnishStrings",
    srcs = [
        "lprojs/fi.lproj/Localizable.strings",
        "lprojs/fi.lproj/InfoPlist.strings",
    ]
)

# OPTIONAL
#####################
#### MARK: LaunchIcon
#####################
filegroup(
    name = "LaunchIcon",
    srcs = glob(["xcassets/LaunchIcon.xcassets/**"])
)

# OPTIONAL
##################
##### MARK: Assets
##################

filegroup(
    name = "Assets",
    srcs = glob(["xcassets/Assets.xcassets/**"]),
)

# OPTIONAL
#######################
##### MARK: ColorAssets
#######################

filegroup(
    name = "ColorAssets",
    srcs = glob(["xcassets/ColorAssets.xcassets/**"]),
)

# REQUIRED
###############################
#### MARK: apple_bundle_version
###############################

apple_bundle_version(
    name = "HelloWorldVersion",
    build_version = "0.0.1",
    short_version_string = "1",
)

# OPTIONAL
###############################
#### MARK: apple_bundle_version
###############################

apple_bundle_version(
    name = "iOSFrameworkVersion",
    build_version = "0.0.1",
    short_version_string = "1",
)

# OPTIONAL
########################
#### MARK: ios_framework
########################

# reduce size of the ios binary
# @see https://github.com/bazelbuild/rules_apple/blob/master/doc/frameworks.md

ios_framework(
    name = "iOSFramework",
    bundle_id = "com.pepeunlimited.ios.framework",
    bundle_name = "iOSFramework",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = [
        "infoplists/HelloWorldiOSFrameworkInfo.plist",
    ],
    frameworks = [],
    minimum_os_version = "12.0",
    version = ":iOSFrameworkVersion",
    extension_safe = True,
    deps = [
        ":Lib",
    ],
    visibility = ["//visibility:public"]
)

# REQUIRED
##########################
#### MARK: ios_application
##########################

# The iOS application.
# deps: (attach reference for)
#   - main.m :Main
#   - Application.swift swift_library:MainSwift
#   - swift_library:Lib
#
# !! NOTICE:                                                                       !!
# !! @see the issue with .xcodeproj https://github.com/bazelbuild/tulsi/issues/357 !!
# !! .xcassets folders won't be visible on the Xcode.                              !!
# !! Sometimes resources changes doesn't appear, workaround is restart simulator.  !!
#
# app_icons:
#   - LaunchIcon iOS/LaunchIcon.xcassets/LaunchIcon.appiconset/(Contents.json and .png) Launch icons for the application
#   - Assets iOS/Assets.xcassets/*.imageset/(Contents.json and .png) Assets for the application
#   - ColorAssets iOS/ColorAssets.xcassets/*.colorset/Contents.json Colors for the application
#
# infoplists:
#   - Info.plist 'Root/Main'.plist for application
#   - HelloWorldInfo.plist CFBundleDisplayName and UIApplicationSceneManifest
#
# strings: (list of .strings, if the directory is named *.lproj files are placed under same name
# in the bundle) 
#   - EnglishStrings iOS/en.lproj/(localizable.strings and InfoPlist.strings)
#   - FinnishStrings iOS/fi.lproj/(localizable.strings and InfoPlist.strings)
#
# @see https://github.com/bazel-ios/rules_ios/blob/master/rules/app.bzl
ios_application(
    name = "HelloWorld",
    bundle_name = "HelloWorld",
    bundle_id = "com.pepeunlimited.helloworld",
    app_icons = [
        ":LaunchIcon",
    ],
    families = [
        "iphone",
        "ipad"
    ],
    infoplists = [
        "infoplists/Info.plist",
        "infoplists/HelloWorldInfo.plist"
    ],
    resources = [
        ":Assets",
        ":ColorAssets"
    ],
    minimum_os_version = "12.0",
    launch_storyboard = "LaunchScreen.storyboard",
    version = ":HelloWorldVersion",
    strings = [
        ":EnglishStrings",
        ":FinnishStrings"
    ],
    frameworks = [
        ":iOSFramework"
    ],
    deps = [
        ":Main",
        ":MainSwift",
        ":Lib",
    ],
    visibility = ["//visibility:public"]
)

# OPTIONAL
####################
#### MARK: xcodeproj
####################
xcodeproj(
    name = "xcodeproj",
    project_name = "helloworld-ios",
    tags = ["manual"],
    top_level_targets = [
        top_level_target(":HelloWorld", target_environments = ["simulator"]),
    ],
)