#
#  WORKSPACE
#
#  Copyright 2022 Pepe Unlimited
#  Licensed under the MIT license, see associated LICENSE file for terms.
#  See AUTHORS file for the list of project authors.
#

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# https://github.com/bazelbuild/rules_apple/releases
http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "20da675977cb8249919df14d0ce6165d7b00325fb067f0b06696b893b90a55e8",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/3.0.0/rules_apple.3.0.0.tar.gz",
)

# https://github.com/bazelbuild/rules_swift/releases
http_archive(
    name = "swift_rules_dependencies",
    sha256 = "abbc41234c37031bc2c561a80fe8a2f8d95efcbbf2a2cb61be0b7201b5dd01a9",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.12.0/rules_swift.1.12.0.tar.gz",
)

# https://github.com/bazelbuild/apple_support/releases
http_archive(
    name = "apple_support_dependencies",
    sha256 = "62cb8c6658739d22986bbe4b025fe9f0f42cce91394096dc85d64b120ccde229",
    url = "https://github.com/bazelbuild/apple_support/releases/download/1.10.1/apple_support.1.10.1.tar.gz",
)

# https://github.com/buildbuddy-io/rules_xcodeproj/releases
http_archive(
    name = "com_github_buildbuddy_io_rules_xcodeproj",
    sha256 = "d16de271048004ea27f98d6fefcb02214337920617a2678f58e8458980243a5f",
    url = "https://github.com/MobileNativeFoundation/rules_xcodeproj/releases/download/1.12.1/release.tar.gz",
)

# https://github.com/bazelbuild/bazel-skylib/releases
http_archive(
    name = "bazel_skylib",
    sha256 = "66ffd9315665bfaafc96b52278f57c7e2dd09f5ede279ea6d39b2be471e7e3aa",
    url = "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.2/bazel-skylib-1.4.2.tar.gz",
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
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
)

xcodeproj_rules_dependencies()

load(
    "@bazel_skylib//:workspace.bzl",
    "bazel_skylib_workspace"
)

bazel_skylib_workspace()

# FIXES The repository '@bazel_features_globals' could not be resolved: Repository '@bazel_features_globals' is not defined.
# REQUIRED by rules_xcodeproj

load("@bazel_features//:deps.bzl", "bazel_features_deps")

bazel_features_deps()
