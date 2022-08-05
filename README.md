xcodeproj-bazel
---------------


Prerequisites
-------------

Install bazelisk via homebrew  
```
$ brew install bazelisk
```

Check that you have installed and configured xcodebuild. If you're not download,
[`Xcode`](https://xcodereleases.com)  

Open the Xcode after installation at least once because it executes configures for macOS
and licence agreements during first launch.  

```
$ /usr/bin/xcodebuild -version
```

Build and run tulsi for .xcodeproj  
```
sh $SRCROOT/xcodeproj-bazel/build-system/tulsi build_and_run.sh -x $XCODE_VERSION
```

Getting started
-------------

Generate .tulsiproj  
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

Generate .xcodeproj  
```
$ sh build-system/generate-xcodeproj.sh \
--verbose \
--genconfig build-input/gen/project/HelloWorld.tulsiproj:HelloWorld \
--bazel /usr/local/bin/bazel \
--outputfolder build-input/gen/project \
--no-open-xcode
```

```
$ bazel build //HelloWorld/iOS:HelloWorld
```

```
$ bazel run //HelloWorld/iOS:HelloWorld
```

```
$ open $SRCROOT/xcodeproj-bazel/build-input/gen/project/HelloWorld.xcodeproj
```

```
$ bazel clean --expunge
```

If you do set launchscreen UIScreen.main.bounds and windowScene.coordinateSpace.bounds do
not cover entair screen

License
-------

**xcodeproj-bazel** is released under the MIT license. See `LICENSE` for details.
