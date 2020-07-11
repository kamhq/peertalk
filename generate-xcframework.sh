#!/bin/bash

xcodebuild archive -scheme "Peertalk iOS" -destination="iOS" -archivePath /tmp/xcf/ios.xcarchive -derivedDataPath /tmp/iphoneos -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
xcodebuild archive -scheme "Peertalk iOS" -destination="iOS Simulator" -archivePath /tmp/xcf/iossimulator.xcarchive -derivedDataPath /tmp/iphoneos -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
xcodebuild -create-xcframework -framework /tmp/xcf/ios.xcarchive/Products/Library/Frameworks/Peertalk.framework -framework /tmp/xcf/iossimulator.xcarchive/Products/Library/Frameworks/Peertalk.framework -output ./Peertalk-iOS.xcframework

echo "./Peertalk-iOS.xcframework created"
