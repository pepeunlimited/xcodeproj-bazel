xcodeproj-bazel
---------------

```
$ sh build-system/generate-xcodeproj.sh \  
--verbose \  
--bazel /usr/local/bin/bazel \  
--target HelloWorld/iOS:HelloWorld \  
--outputfolder build-input/gen/project \  
--create-tulsiproj HelloWorld.tulsiproj \     
--workspaceroot ./ \  
--build-options --disk_cache="$HOME/helloworld-bazel-cache"
```

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

If you do set launchscreen UIScreen.main.bounds and windowScene.coordinateSpace.bounds do
not cover entair screen

License
-------

**xcodeproj-bazel** is released under the MIT license. See `LICENSE` for details.
