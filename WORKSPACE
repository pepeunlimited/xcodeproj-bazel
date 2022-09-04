#
#  WORKSP
#
#  Copyright 2022 Pepe Unlimited
#  Licensed under the MIT license, see associated LICENSE file for terms.
#  See AUTHORS file for the list of project authors.
#

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# https://github.com/bazelbuild/rules_apple/releases
http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "a19cf84dd060eda50be9ba5b0eca88377e0306ffbc1cc059df6a6947e48ac61a",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/1.1.1/rules_apple.1.1.1.tar.gz",
)

# https://github.com/bazelbuild/rules_swift/releases
http_archive(
    name = "swift_rules_dependencies",
    sha256 = "043897b483781cfd6cbd521569bfee339c8fbb2ad0f0bdcd1b3749523a262cf4",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.1.1/rules_swift.1.1.1.tar.gz",
)

# https://github.com/bazelbuild/apple_support/releases
http_archive(
    name = "apple_support_dependencies",
    sha256 = "d94b7a0f49d735f196e1f36d2e6ef79c4e8e8b82132848dd8cd93cd82d9b12a8",
    url = "https://github.com/bazelbuild/apple_support/releases/download/1.3.0/apple_support.1.3.0.tar.gz",
)

http_archive(
    name = "bazel_skylib",
    sha256 = "f7be3474d42aae265405a592bb7da8e171919d74c16f082a5457840f06054728",
    url = "https://github.com/bazelbuild/bazel-skylib/releases/download/1.2.1/bazel-skylib-1.2.1.tar.gz",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

load(
    "@bazel_skylib//:workspace.bzl",
    "bazel_skylib_workspace"
)

bazel_skylib_workspace()
