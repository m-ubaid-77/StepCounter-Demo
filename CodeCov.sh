#!/bin/bash

set -euo pipefail

echo "🚀 Starting Code Coverage Script..."

fail() {
  echo "❌ BUILD_FAILED"
  exit 1
}

trap fail ERR

# Clean build
xcodebuild clean

# Run tests with coverage
xcodebuild \
  -scheme StepCounter \
  -project StepCounter.xcodeproj \
  -destination 'platform=iOS Simulator' \
  -enableCodeCoverage YES \
  -parallel-testing-enabled NO \
  test

# Find latest xcresult
XCRESULT_PATH=$(find ~/Library/Developer/Xcode/DerivedData \
  -type d -name "*.xcresult" \
  -exec stat -f "%m %N" {} \; \
  | sort -rn | head -n 1 | cut -d' ' -f2-)

echo "XCResult found: $XCRESULT_PATH"

# Extract coverage
APP_COVERAGE=$(xcrun xccov view --report "$XCRESULT_PATH" \
  | grep "StepCounter.app" \
  | head -n 1 \
  | awk '{ print $2 }')

echo "📈 App Test Coverage: $APP_COVERAGE"
echo "✅ COVERAGE_SUCCESS"
