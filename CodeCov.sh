#!/bin/bash

# Ensure the script exits if any command fails
set -o pipefail

echo "Starting tests..."

# Run tests
xcodebuild clean

if xcodebuild \
  -scheme StepCounter \
  -project StepCounter.xcodeproj \
  -destination 'platform=iOS Simulator,name=iPhone 17,OS=26.1' \
  -enableCodeCoverage YES \
  -parallel-testing-enabled NO \
  test; then
    
    # SUCCESS PATH
    XCRESULT_PATH=$(find ~/Library/Developer/Xcode/DerivedData \
      -type d -name "*.xcresult" \
      -exec stat -f "%m %N" {} \; \
      | sort -rn | head -n 1 | cut -d' ' -f2-)

    APP_COVERAGE=$(xcrun xccov view --report "$XCRESULT_PATH" \
      | grep "StepCounter.app" \
      | head -n 1 \
      | awk '{ print $2 }')

    echo "📈 App Test Coverage: $APP_COVERAGE"
else
    # FAILURE PATH
    echo "❌ BUILD_FAILED"
    exit 1
fi
