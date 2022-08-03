xcodeproj-bazel
---------------

`
$ sh build-system/generate-xcodeproj.sh \<br/>
--verbose \<br/>
--bazel /usr/local/bin/bazel \<br/>
--target HelloWorld/iOS:HelloWorld \<br/>
--outputfolder build-input/gen/project \<br/>     
--create-tulsiproj HelloWorld.tulsiproj \<br/>
--workspaceroot ./ \<br/>
--build-options --disk_cache="$HOME/helloworld-bazel-cache"
`

`
$ sh build-system/generate-xcodeproj.sh \<br/>
--verbose \<br/>
--genconfig build-input/gen/project/HelloWorld.tulsiproj:HelloWorld \<br/>
--bazel /usr/local/bin/bazel \<br/>
--outputfolder build-input/gen/project \<br/>
--no-open-xcode
`

`
$ bazel build //HelloWorld/iOS:HelloWorld
`

`
$ bazel run //HelloWorld/iOS:HelloWorld
`

`
$ open $SRCROOT/xcodeproj-bazel/build-input/gen/project/HelloWorld.xcodeproj
`

If you do set launchscreen UIScreen.main.bounds and windowScene.coordinateSpace.bounds do
not cover entair screen

License
-------

**xcodeproj-bazel** is released under the MIT license. See `LICENSE` for details.
