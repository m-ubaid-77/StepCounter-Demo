# 🚶‍♂️ StepCounter-Demo

[![Swift](https://img.shields.io/badge/Swift-5.5-orange.svg)]()
[![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)]()
[![SwiftLint](https://img.shields.io/badge/SwiftLint-Enabled-brightgreen.svg)]()
[![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)](LICENSE)

A modern iOS application that tracks your daily step count using Core Motion's `CMPedometer`. Built with SwiftUI, Clean Architecture, and comprehensive testing in mind.

## 📱 Features

- Real-time step counting using Core Motion
- Motion permission handling
- Clean Architecture implementation
- Unit and UI testing
- Dependency Injection with Swinject
- Dark/Light mode support

## 🏗️ Architecture

The app follows Clean Architecture principles with three main layers:

1. **Presentation Layer**
   - SwiftUI Views
   - ViewModels (MVVM)
   - View-specific logic and state management

2. **Domain Layer**
   - Business logic
   - Use Cases
   - Repository interfaces
   - Domain models

3. **Infrastructure Layer**
   - Repository implementations
   - Service integrations
   - Data sources
   - Dependency Injection setup

## 🛠️ Requirements

- iOS 16.4+
- Xcode 16.0+
- Swift 6.0+
- [SwiftLint](https://github.com/realm/SwiftLint) (for code style enforcement)

## 🚀 Getting Started

### Prerequisites

1. Install Xcode from the Mac App Store
2. Install SwiftLint (for code style enforcement):
   ```bash
   brew install swiftlint
   ```

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/StepCounter-Demo.git
   cd StepCounter-Demo
   ```

2. Open the project in Xcode:
   ```bash
   open StepCounter.xcodeproj
   ```

3. Build and run the project (⌘R)

## 🧪 Testing

The project includes both unit tests and UI tests to ensure code quality and functionality.

### Running Tests

- **Run all tests**: `⌘U` in Xcode
- **Run specific test class**: Click the diamond icon next to the test class
- **Run a single test**: Click the diamond icon next to the test function

### Test Structure

- **Unit Tests**: Located in `StepCounterTests/`
  - ViewModel tests
  - UseCase tests
  - Utility function tests

- **UI Tests**: Located in `StepCounterUITests/`
  - Screen navigation tests
  - User interaction tests
  - Permission flow tests

## 🧩 Dependencies

- **Swinject**: For dependency injection
- **SwiftLint**: For code style enforcement (development only)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📚 Resources

- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui/)
- [Core Motion Framework](https://developer.apple.com/documentation/coremotion/)

## 📬 Contact

Muhammad Ubaid - [@LinkedIn](https://www.linkedin.com/in/muhammadubaid77/)

Project Link: [https://github.com/m-ubaid-77/StepCounter-Demo](https://github.com/m-ubaid-77/StepCounter-Demo)
