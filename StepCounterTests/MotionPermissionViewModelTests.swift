//
//  MotionPermissionViewModelTests.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 12/01/2026.
//


import XCTest
@testable import StepCounter

@MainActor
final class MotionPermissionViewModelTests: XCTestCase {

    // MARK: - Authorized Flow
    func test_allowAccess_whenAuthorized_setsRootToHome() async {
        let provider = MockMotionPermissionProvider()
        provider.requestResult = .authorized

        let requestUseCase = RequestMotionSensorPermissionUseCase(provider: provider)
        let checkUseCase = CheckMotionPermissionUseCase(provider: provider)
        let router = MockRouter()

        let viewModel = MotionPermissionViewModel(
            requestPermissionUseCase: requestUseCase,
            checkPermissionUseCase: checkUseCase,
            router: router
        )

        await viewModel.allowAccessButtonPressed()

        XCTAssertEqual(router.lastRoute, .home)
    }

    // MARK: - Denied Flow
    func test_allowAccess_whenDenied_opensAppSettings() async {
        let provider = MockMotionPermissionProvider()
        provider.requestResult = .denied

        let requestUseCase = RequestMotionSensorPermissionUseCase(provider: provider)
        let checkUseCase = CheckMotionPermissionUseCase(provider: provider)
        let router = MockRouter()

        let viewModel = MotionPermissionViewModel(
            requestPermissionUseCase: requestUseCase,
            checkPermissionUseCase: checkUseCase,
            router: router
        )

        await viewModel.allowAccessButtonPressed()

        // Should NOT navigate to home
        XCTAssertEqual(router.lastRoute, Route.motionSensorPermission)
    }

    // MARK: - Restricted Flow
    func test_allowAccess_whenRestricted_opensAppSettings() async {
        let provider = MockMotionPermissionProvider()
        provider.requestResult = .restricted

        let requestUseCase = RequestMotionSensorPermissionUseCase(provider: provider)
        let checkUseCase = CheckMotionPermissionUseCase(provider: provider)
        let router = MockRouter()

        let viewModel = MotionPermissionViewModel(
            requestPermissionUseCase: requestUseCase,
            checkPermissionUseCase: checkUseCase,
            router: router
        )

        await viewModel.allowAccessButtonPressed()

        XCTAssertEqual(router.lastRoute, Route.motionSensorPermission)
    }
}
