#!/bin/bash

#installing flutter for macOS:
brew update
brew install --cask flutter

echo "Creating flutter project"
flutter create live_transport

cd my_app

PROCESS_NAME="Simulator"

if pgrep "$PROCESS_NAME" > /dev/null; then
    echo "Killing Process $PROCESS_NAME=..."
    killall "$PROCESS_NAME"
else
    echo "Process $PROCESS_NAMENot found. "
fi
echo "Running IOS Simulator on iPhone 16 pro"
open -a Simulator && xcrun simct boot "iPhone 16 Pro"

echo "Installing flutter packages"
flutter pub add flutter_dotenv
flutter pub add webview_flutter

echo "initializing git repo"
git init .