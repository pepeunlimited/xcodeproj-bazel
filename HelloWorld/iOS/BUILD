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
        "main.m"
    ],
)

# REQUIRED
########################
#### MARK: swift_library
########################

swift_library(
    name = "MainSwift",
    srcs = glob([
        "Application.swift",
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
        "SceneDelegate.swift",
        "AppDelegate.swift",
        "OSLog+extension.swift",
        "Localization.swift",
        "HelloWorldViewController.swift"
    ]),
    visibility = ["//visibility:private"]
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
        "en.lproj/Localizable.strings",
        "en.lproj/InfoPlist.strings",
    ]
)

# Finnish localizations

filegroup(
    name = "FinnishStrings",
    srcs = [
        "fi.lproj/Localizable.strings",
        "fi.lproj/InfoPlist.strings",
    ]
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
# infoplists:
#   - Info.plist 'Root/Main'.plist for application
#   - HelloWorldInfo.plist CFBundleDisplayName and UIApplicationSceneManifest
#
# strings: (list of .strings, if the directory is named *.lproj files are placed under same name
# in the bundle) 
#   - EnglishStrings iOS/en.lproj/(localizable.strings and InfoPlist.strings)
#   - FinnishStrings iOS/fi.lproj/(localizable.strings and InfoPlist.strings)
ios_application(
    name = "HelloWorld",
    bundle_name = "HelloWorld",
    bundle_id = "com.pepeunlimited.helloworld",
    families = [
        "iphone",
        "ipad"
    ],
    infoplists = [
        "Info.plist",
        "HelloWorldInfo.plist"
    ],
    minimum_os_version = "12.0",
    launch_storyboard = "LaunchScreen.storyboard",
    resources = [],
    version = ":HelloWorldVersion",
    strings = [
        ":EnglishStrings",
        ":FinnishStrings"
    ],
    deps = [
        ":Main",
        ":MainSwift",
        ":Lib"
    ],
    visibility = ["//visibility:public"]
)
