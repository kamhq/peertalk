#!/bin/bash

xcodebuild archive -scheme "Peertalk iOS" -destination="iOS" -archivePath /tmp/xcf/ios.xcarchive -derivedDataPath /tmp/iphoneos -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
xcodebuild archive -scheme "Peertalk iOS" -destination="iOS Simulator" -archivePath /tmp/xcf/iossimulator.xcarchive -derivedDataPath /tmp/iphoneos -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
xcodebuild -create-xcframework -framework /tmp/xcf/ios.xcarchive/Products/Library/Frameworks/Peertalk.framework -framework /tmp/xcf/iossimulator.xcarchive/Products/Library/Frameworks/Peertalk.framework -output ./Peertalk-iOS.xcframework

echo "./Peertalk-iOS.xcframework created"

xcodebuild archive -scheme "Peertalk" -destination 'platform=macOS,arch=x86_64' -archivePath /tmp/xcf/macOS.xcarchive -derivedDataPath /tmp/macOS -sdk macosx SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
xcodebuild -create-xcframework -framework /tmp/xcf/macOS.xcarchive/Products/Library/Frameworks/Peertalk.framework -framework /tmp/xcf/macOS.xcarchive/Products/Library/Frameworks/Peertalk.framework -output ./Peertalk-macOS.xcframework


echo "./Peertalk-macOS.xcframework created"
