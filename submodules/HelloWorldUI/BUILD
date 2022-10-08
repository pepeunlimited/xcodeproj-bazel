#
#  BUILD
#
#  Copyright 2022 Pepe Unlimited
#  Licensed under the MIT license, see associated LICENSE file for terms.
#  See AUTHORS file for the list of project authors.
#

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
    ]),
    deps = [
        "//submodules/SharedKit:SharedKit",
        "//submodules/OSExtension:OSExtension",
        "//submodules/UIKitExtension:UIKitExtension",
    ],
    visibility = ["//visibility:public"]
)
