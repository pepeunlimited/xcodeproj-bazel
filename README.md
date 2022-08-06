axcodeproj-bazel
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

Open the Xcode after installation at least once because it executes configures for macOS
and licence agreements during first launch.  

```
$ /usr/bin/xcodebuild -version
```

Build and run [`Tulsi`](https://tulsi.bazel.build/)  
```
$ sh build-system/tulsi/build_and_run.sh -x $XCODE_VERSION
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
--additionalSourceFilters HelloWorld/iOS \
--build-options --disk_cache="$HOME/helloworld-bazel-cache"
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

Documentation & Links
-------------

[`bazelbuild/rules_apple`](https://github.com/bazelbuild/rules_apple/tree/master/doc)  
[`bazelbuild/rules_swift`](https://github.com/bazelbuild/rules_swift/tree/master/doc)  
[`bazelbuild/apple_support`](https://github.com/bazelbuild/apple_support/tree/master/doc)  
[`bazelbuild/bazel-skylib`](https://github.com/bazelbuild/bazel-skylib/tree/main/docs)  
<br/>
[`Bazel Tutorial: Build an iOS App`](https://bazel.build/tutorials/ios-app)  
[`Migrating from Xcode to Bazel`](https://bazel.build/migrate/xcode)  
[`Building with Bazel`](https://www.raywenderlich.com/31558158-building-with-bazel/)  
[`ios_and_bazel_at_reddit_a_journey`](https://www.reddit.com/r/RedditEng/comments/syz5dw/ios_and_bazel_at_reddit_a_journey/)  


iOS
---

`LaunchScreen.storyboard` is required to be configured, otherwise `UIScreen.main.bounds` and `windowScene.coordinateSpace.bounds` causes misbehavior for application.  

Bazel
-----

Build  
```
$ bazel build //HelloWorld/iOS:HelloWorld
```

Run  
```
$ bazel run //HelloWorld/iOS:HelloWorld
```

Clean  
```
$ bazel clean --expunge
```

License
-------

**xcodeproj-bazel** is released under the MIT license. See `LICENSE` for details.
