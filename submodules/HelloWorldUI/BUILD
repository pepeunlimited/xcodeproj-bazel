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
    "swift_library",
)

# REQUIRED
########################
#### MARK: swift_library
########################

# module_name is required
swift_library(
    name = "HelloWorldUI",
    module_name = "HelloWorldUI",
    srcs = glob([
        "Sources/HelloWorldViewController.swift",
        "Sources/RGBColorView.swift",
        "Sources/Localization.swift",
        "Sources/WhatsNewViewController.swift",
        "Sources/FeedViewController.swift",
        "Sources/FeedViewDelegate.swift",
        "Sources/TestViewController.swift",
        "Sources/PageViewController.swift",
        "Sources/OnBoardingViewController.swift",
        "Sources/LoadingView.swift",
        "Sources/TestViewController2.swift"
    ]),
    deps = [
        "//submodules/SharedKit:SharedKit",
        "//submodules/OSExtension:OSExtension",
        "//submodules/UIKitExtension:UIKitExtension",
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
########################
#### MARK: swift_library
########################

# notice testonly = true
 
swift_library(
    name = "SwiftXCLib",
    srcs = glob([
        "Sources/XCTest/*.swift"
    ]),
    testonly = True,
#    srcs = glob(["**/*.swift"]),
    deps = [
        ":HelloWorldUI"
    ],
    visibility = ["//visibility:private"]
)

# OPTIONAL
########################
#### MARK: ios_unit_test
########################

ios_unit_test(
    name = "XCUnitTest",
    deps = [
        ":SwiftXCLib"
    ],
    env = helloworld_env,
    platform_type = "ios",
    minimum_os_version = "12.0",
    visibility = ["//visibility:private"]
)

# OPTIONAL
#####################
#### MARK: test_suite
#####################

test_suite(
    name = "XCUnitTestSuite",
    tests = [
        ":XCUnitTest"
    ],
)
