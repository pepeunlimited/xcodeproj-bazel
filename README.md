xcodeproj-bazel
---------------

Minimal setup for `.xcodeproj` with the [`bazel build system`](https://bazel.build/)  

Prerequisites
-------------

```
$ git clone --recursive https://github.com/pepeunlimited/xcodeproj-bazel.git
```

Install bazelisk via homebrew  
```
$ brew install bazelisk
```

Check that you have installed and configured xcodebuild. If you're not download
[`Xcode`](https://xcodereleases.com)  


Install the Command Line Tools  
```
$ xcode-select --install
```

Open the Xcode after installation at least once because it executes configures for macOS
and licence agreements during first launch.  

```
$ /usr/bin/xcodebuild -version
```

Build and run [`Tulsi`](https://tulsi.bazel.build/)  
```
$ (cd build-system/tulsi; sh build_and_run.sh -x 14.0)
```

Test that bazel should be able to build iOS project with the Bazel
```
$ bazel build //HelloWorld/iOS:HelloWorld
```

Getting started
---------------

Generate `.tulsiproj`  
```
$ sh build-system/generate-xcodeproj.sh \
--verbose \
--bazel /usr/local/bin/bazel \
--target HelloWorld/iOS:HelloWorld \
--outputfolder build-input/gen/project \
--create-tulsiproj HelloWorld.tulsiproj \
--workspaceroot ./ \
--additionalSourceFilters HelloWorld\ submodules \
--build-options \
--disk_cache="$HOME/helloworld-bazel-cache"
```

Generate `.xcodeproj`  
```
$ sh build-system/generate-xcodeproj.sh \
--verbose \
--genconfig build-input/gen/project/HelloWorld.tulsiproj:HelloWorld \
--bazel /usr/local/bin/bazel \
--outputfolder build-input/gen/project \
--no-open-xcode
```

Open the `Xcode`
```
$ open $SRCROOT/xcodeproj-bazel/build-input/gen/project/HelloWorld.xcodeproj
```

iOS
---

`LaunchScreen.storyboard` is required to be configured, otherwise `UIScreen.main.bounds` and `windowScene.coordinateSpace.bounds` causes misbehavior for application.  

Build the `iOS` application  
```
$ bazel build //HelloWorld/iOS:HelloWorld
```

Run the `iOS` application  
```
$ bazel run //HelloWorld/iOS:HelloWorld
```

Build the `SharedKit` swift_test
```
$ bazel build //submodules/SharedKit:SwiftXCTest
```

Run the `SharedKit` swift_test  
```
$ bazel test //submodules/SharedKit:SwiftXCTest
```

Build `OSExtension`
```
$ bazel build //submodules/OSExtension:OSExtension
```

Build the `HelloWorldUI` ios_unit_test  
```
$ bazel build //submodules/HelloWorldUI:XCUnitTestSuite
```

Run the `HelloWorldUI` ios_unit_test  
```
$ bazel test //submodules/HelloWorldUI:XCUnitTestSuite
```

Bazel
-----

Clean  
```
$ bazel clean --expunge
```

Simulator
---------

Boot  
```
$ xcrun simctl boot "iPhone 14"
```

Open Simulator.app  
```
$ open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
```

[`Failed to start launchd_sim: could not bind to session`](https://stackoverflow.com/questions/65172944/when-running-on-older-ios-simulator-error-failed-to-start-launchd-sim-could-n)

oslog
-----

See the list of running simulators  
```
$ xcrun simctl list
```

View the log stream on console  
```
$ xcrun simctl spawn '5A709945-ED74-45F3-A248-AA289FE92497' log stream --debug --predicate 'subsystem == "com.pepeunlimited.helloworld"'
```

VSCode
------

Edit your `settings.json` and add below arguments for `vscode-swift` extension  

show-sdk-path  
```
$ xcrun --sdk iphonesimulator --show-sdk-path
```

<br/>

```
  "swift.buildArguments": [
    "--arch",
    "x86_64",
    "-Xswiftc",
    "-target",
    "-Xswiftc",
    "x86_64-apple-ios16.0-simulator"
  ],
  "swift.SDK": "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk",
```

Swift
-----

[`api-design-guidelines`](https://www.swift.org/documentation/api-design-guidelines/)  
[`.swiftlint.yml`](https://realm.github.io/SwiftLint/rule-directory.html)  

Documentation & Links
---------------------

[`This documentation is collected from rulesets in the bazelbuild GitHub org`](https://docs.aspect.build/)
<br/>
[`bazelbuild/rules_apple`](https://github.com/bazelbuild/rules_apple/tree/master/doc)  
[`bazelbuild/rules_swift`](https://github.com/bazelbuild/rules_swift/tree/master/doc)  
[`bazelbuild/apple_support`](https://github.com/bazelbuild/apple_support/tree/master/doc)  
[`bazelbuild/bazel-skylib`](https://github.com/bazelbuild/bazel-skylib/tree/main/docs)  
[`bazel.build/command-line-reference`](https://bazel.build/reference/command-line-reference)  
<br/>
[`Bazel Tutorial: Build an iOS App`](https://bazel.build/tutorials/ios-app)  
[`Migrating from Xcode to Bazel`](https://bazel.build/migrate/xcode)  
[`Building with Bazel`](https://www.raywenderlich.com/31558158-building-with-bazel/)  
[`ios_and_bazel_at_reddit_a_journey`](https://www.reddit.com/r/RedditEng/comments/syz5dw/ios_and_bazel_at_reddit_a_journey/)  
[`migrating-ios-project-to-bazel-a-real-world-experience`](https://liuliu.me/eyes/migrating-ios-project-to-bazel-a-real-world-experience/)  
<br/>
[`google-mediapipe-examples-ios`](https://github.com/google/mediapipe/tree/master/mediapipe/examples/ios)  
[`Telegram-iOS`](https://github.com/TelegramMessenger/Telegram-iOS)  
[`liuliu/dflat`](https://github.com/liuliu/dflat)  
[`wendyliga/simple_bazel`](https://github.com/wendyliga/simple_bazel)  
[`TulsiGeneratorIntegrationTests`](https://github.com/bazelbuild/tulsi/tree/master/src/TulsiGeneratorIntegrationTests/Resources)  
[`iOS Dynamic vs. Static Library / Framework`](https://gist.github.com/SheldonWangRJT/78c9bd3b98488487c59a6a4a9c35162c)  
<br/>
[`.imageset`](https://appicon.co/#image-sets)  
<br/>


License
-------

**xcodeproj-bazel** is released under the MIT license. See `LICENSE` for details.
´