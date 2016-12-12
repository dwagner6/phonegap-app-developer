#!/usr/bin/env bash
echo "Running: npm run build"
npm run build

echo "Running: setup-ad-hoc.js"
node ./setup-ad-hoc.js

echo "Adding hockey app"
phonegap plugin add cordova-plugin-hockeyapp

echo "Running: phonegap build ios"
phonegap build ios --verbose --device --debug --buildConfig=./resources/signing/ios/build-config.json

echo "Running: restore-config.js"
node ./restore-config.js
