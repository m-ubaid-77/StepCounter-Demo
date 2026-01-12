//
//  MockMotionPermissionProvider.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 12/01/2026.
//

final class MockMotionPermissionProvider: MotionPermissionProviderProtocol {
    var checkResult: AppPermissionState = .notDetermined
    var requestResult: AppPermissionState = .notDetermined

    func checkStatus() -> AppPermissionState {
        checkResult
    }

    func requestPermission() async -> AppPermissionState {
        requestResult
    }
}
