#
#  BUILD
#
#  Copyright 2022 Pepe Unlimited
#  Licensed under the MIT license, see associated LICENSE file for terms.
#  See AUTHORS file for the list of project authors.
#

#load("@build_bazel_rules_apple//apple:versioning.bzl",
#     "apple_bundle_version",
#)

load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_unit_test"
#   "ios_framework",
)

load("@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
    "swift_test"
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

# OPTIONAL
################################
#### MARK: Environment Variables
################################

helloworld_env = {
  "VARIABLE_1": "Something1",
  "VARIABLE_2": "Something2",
}

# OPTIONAL
########################
#### MARK: swift_test
########################

swift_test(
    name = "XCUnitLib",
    srcs = glob([
        "XCTest/HelloWorldXCTest.swift"
    ]),
#    srcs = glob(["**/*.swift"]),
#    srcs = glob(["src/*.swift"]),
    visibility = ["//visibility:public"]
)

# OPTIONAL
########################
#### MARK: ios_unit_test
########################

ios_unit_test(
    name = "XCUnitTest",
    deps = [
        ":XCUnitLib"
    ],
    platform_type = "ios",
    minimum_os_version = "12.0",
)

# OPTIONAL
########################
#### MARK: test_suite
########################

test_suite(
    name = "XCUnitTestSuite",
    tests = [
        ":XCUnitTest"
    ],
)


# OPTIONAL
###############################
#### MARK: apple_bundle_version
###############################

#apple_bundle_version(
#    name = "SharedKitFrameworkVersion",
#    build_version = "0.0.1",
#    short_version_string = "1",
#)

# OPTIONAL
########################
#### MARK: ios_framework
########################

#ios_framework(
#    name = "SharedKitFramework",
#    bundle_id = "com.pepeunlimited.sharedkit",
#    bundle_name = "SharedKit",
#    families = [
#        "iphone",
#        "ipad",
#    ],
#    infoplists = [
#        "Info.plist",
#    ],
#    frameworks = [],
#    minimum_os_version = "12.0",
#    version = ":SharedKitFrameworkVersion",
#    extension_safe = True,
#    deps = [
#        ":SharedKit",
#    ],
#    visibility = ["//visibility:public"]
#)
