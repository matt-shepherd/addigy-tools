#!/bin/bash

if [ ! -d "/Applications/Webroot SecureAnywhere.app" ]; then
    echo "not installed"
else
    /usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "/Applications/Webroot SecureAnywhere.app/Contents/Info.plist";
fi