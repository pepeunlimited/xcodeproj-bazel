#
#  BUILD
#
#  Copyright 2022 Pepe Unlimited
#  Licensed under the MIT license, see associated LICENSE file for terms.
#  See AUTHORS file for the list of project authors.
#

load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_unit_test"
)

load("@build_bazel_rules_swift//swift:swift.bzl",
    "swift_test",
)

# OPTIONAL
################################
#### MARK: Environment Variables
################################

helloworld_env = {
  "VARIABLE_1": "Something1",
  "VARIABLE_2": "Something2",
}

# REQUIRED
########################
#### MARK: swift_test
########################

swift_test(
    name = "XCUnitTestLib",
    srcs = glob([
        "HelloWorldXCTest.swift"
    ]),
#    srcs = glob(["**/*.swift"]),
#    srcs = glob(["src/*.swift"]),
    visibility = ["//visibility:public"]
)

# REQUIRED
########################
#### MARK: ios_unit_test
########################

ios_unit_test(
    name = "XCUnitTest",
    deps = [
        ":XCUnitTestLib"
    ],
    platform_type = "ios",
    minimum_os_version = "12.0",
)

# REQUIRED
########################
#### MARK: ios_unit_test
########################

test_suite(
    name = "XCUnitTestSuite",
    tests = [
        ":XCUnitTest"
    ],
)