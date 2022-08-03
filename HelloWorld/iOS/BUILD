load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application"
)

load("@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
)

objc_library(
    name = "Main",
    srcs = [
        "main.m"
    ],
)

swift_library(
   name = "Lib",
   srcs = glob([
    "Application.swift",
    "SceneDelegate.swift",
    "AppDelegate.swift",
    ]),
   visibility = ["//visibility:private"]
)

ios_application(
   name = "HelloWorld",
   deps = [":Main", ":Lib"], 
   bundle_id = "com.pepeunlimited.helloworld",
   families = [
       "iphone",
       "ipad"
   ],
   infoplists = ["Info.plist"],
   launch_storyboard = "LaunchScreen.storyboard",
   resources = [],
   minimum_os_version = "12.0",
   visibility = ["//visibility:public"]
)
