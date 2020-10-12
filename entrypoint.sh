#!/bin/bash

hub checkout master
hub release create -a ./${APP_FOLDER}/build/outputs/apk/free/debug/*-debug.apk -a ./${APP_FOLDER}/build/outputs/apk/paid/debug/*-debug.apk -m "${RELEASE_TITLE} - ${VERSION_NAME}" $(VERSION_NAME) 
