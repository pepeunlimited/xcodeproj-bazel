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
    name = "SharedKit",
    module_name = "SharedKit",
    srcs = glob([
        "Sources/Haberdasher.swift",
    ]),
    visibility = ["//visibility:public"]
)

# REQUIRED
###############################
#### MARK: apple_bundle_version
###############################

apple_bundle_version(
    name = "SharedKitFrameworkVersion",
    build_version = "0.0.1",
    short_version_string = "1",
)

# OPTIONAL
########################
#### MARK: ios_framework
########################

ios_framework(
    name = "SharedKitFramework",
    bundle_id = "com.pepeunlimited.sharedkit",
    bundle_name = "SharedKit",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = [
        "Info.plist",
    ],
    frameworks = [],
    minimum_os_version = "12.0",
    version = ":SharedKitFrameworkVersion",
    extension_safe = True,
    deps = [
        ":SharedKit",
    ],
    visibility = ["//visibility:public"]
)
