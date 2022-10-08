#
#  BUILD
#
#  Copyright 2022 Pepe Unlimited
#  Licensed under the MIT license, see associated LICENSE file for terms.
#  See AUTHORS file for the list of project authors.
#

load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_framework",
)

load("@build_bazel_rules_apple//apple:versioning.bzl",
     "apple_bundle_version",
)

load("@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
)

# REQUIRED
########################
#### MARK: swift_library
########################

# module_name is required
swift_library(
    name = "OSExtension",
    module_name = "OSExtension",
    srcs = glob([
        "Sources/OSLog+extension.swift",
    ]),
    visibility = ["//visibility:public"]
)

# REQUIRED
###############################
#### MARK: apple_bundle_version
###############################

apple_bundle_version(
    name = "OSExtensionFrameworkVersion",
    build_version = "0.0.1",
    short_version_string = "1",
)

# OPTIONAL
########################
#### MARK: ios_framework
########################

ios_framework(
    name = "OSExtensionFramework",
    bundle_id = "com.pepeunlimited.os.extension",
    bundle_name = "OSExtension",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = [
        "Info.plist",
    ],
    frameworks = [],
    minimum_os_version = "12.0",
    version = ":OSExtensionFrameworkVersion",
    extension_safe = True,
    deps = [
        ":OSExtension",
    ],
    visibility = ["//visibility:public"]
)
