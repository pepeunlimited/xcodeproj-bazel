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
    name = "FoundationExtension",
    module_name = "FoundationExtension",
    srcs = glob([
        "Sources/*.swift",
    ]),
    visibility = ["//visibility:public"]
)
