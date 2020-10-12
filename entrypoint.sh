#!/bin/bash

hub checkout master
hub release create -a ./${APP_FOLDER}/build/outputs/apk/free/debug/*-debug.apk -a ./${APP_FOLDER}/build/outputs/apk/paid/debug/*-debug.apk -m "${RELEASE_TITLE} - v${VERSION_NAME}" $(date +%Y%m%d%H%M%S) 
