#!/bin/bash

hub checkout master
hub release create -m "${RELEASE_TITLE} - ${VERSION_NAME}" ${VERSION_NAME} 
if [ "${INCLUDE_DEBUG_FREE+n}" == "Y" ]; then hub release edit -a ./${APP_FOLDER}/build/outputs/apk/free/debug/*-debug.apk ${VERSION_NAME}; else echo "Skipping Debug free"; fi
if [ "${INCLUDE_DEBUG_PAID+n}" == "Y" ]; then hub release edit -a ./${APP_FOLDER}/build/outputs/apk/paid/debug/*-debug.apk ${VERSION_NAME}; else echo "Skipping Debug paid"; fi
if [ "${INCLUDE_RELEASE_FREE+n}" == "Y" ]; then hub release edit -a ./${APP_FOLDER}/build/outputs/apk/free/release/*.apk ${VERSION_NAME}; else echo "Skipping release free"; fi
if [ "${INCLUDE_RELEASE_PAID+n}" == "Y" ]; then hub release edit -a ./${APP_FOLDER}/build/outputs/apk/paid/release/*.apk ${VERSION_NAME}; else echo "Skipping release paid"; fi
