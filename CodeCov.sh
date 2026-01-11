#!/bin/bash

# Ensure script exits with error if xcodebuild fails
set -o pipefail

echo "🧹 Cleaning previous builds..."
xcodebuild clean -project StepCounter.xcodeproj -scheme StepCounter > /dev/null

echo "🚀 Running tests for StepCounter..."

# Run xcodebuild and capture the exit code
xcodebuild \
  -scheme StepCounter \
  -project StepCounter.xcodeproj \
  -destination 'platform=iOS Simulator,name=iPhone 17' \
  -enableCodeCoverage YES \
  -parallel-testing-enabled NO \
  test

if [ $? -eq 0 ]; then
    # Get latest xcresult
    XCRESULT_PATH=$(find ~/Library/Developer/Xcode/DerivedData \
      -type d -name "*.xcresult" \
      -exec stat -f "%m %N" {} \; \
      | sort -rn | head -n 1 | cut -d' ' -f2-)

    # Extract coverage
    APP_COVERAGE=$(xcrun xccov view --report "$XCRESULT_PATH" \
      | grep "StepCounter.app" \
      | head -n 1 \
      | awk '{ print $2 }')

    echo "📈 App Test Coverage: $APP_COVERAGE"
else
    echo "❌ BUILD_FAILED"
    exit 1
fi
