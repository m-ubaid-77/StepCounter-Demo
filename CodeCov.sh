# Run tests with coverage enabled

xcodebuild clean

xcodebuild \
  -scheme StepCounter \
  -project StepCounter.xcodeproj \
  -destination 'platform=iOS Simulator,name=iPhone 17,OS=26.2' \
  -enableCodeCoverage YES \
  -parallel-testing-enabled NO \
  test

# Get latest xcresult
XCRESULT_PATH=$(find ~/Library/Developer/Xcode/DerivedData \
  -type d -name "*.xcresult" \
  -exec stat -f "%m %N" {} \; \
  | sort -rn | head -n 1 | cut -d' ' -f2-)

echo "XCResult found: $XCRESULT_PATH"

# Extract overall app coverage
APP_COVERAGE=$(xcrun xccov view --report "$XCRESULT_PATH" \
  | grep "StepCounter.app" \
  | head -n 1 \
  | awk '{ print $2 }')

echo "📈 App Test Coverage: $APP_COVERAGE"

