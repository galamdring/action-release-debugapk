#!/bin/bash

find ./$APP_FOLDER/build/outputs/apk -name "*debug.apk" -exec gh release upload "${VERSION_NAME}" {} +
