#!/bin/bash

APP=$(ls "/Applications" | grep "Webroot SecureAnywhere.app")

if [[ "${APP}" == "Webroot SecureAnywhere.app" ]]; then
    echo 'true'
else
    echo 'false'
fi