//
//  FakeMotionPermissionProvider.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 06/01/2026.
//

final class FakeMotionPermissionProvider: MotionPermissionProviderProtocol {

    private var state: AppPermissionState

    init(state: AppPermissionState = .authorized) {
        self.state = state
    }

    func checkStatus() -> AppPermissionState {
        state
    }

    func requestPermission() async -> AppPermissionState {
        if UITestConfig.motionSensorPermission == "notDetermined" {
            state = .authorized
        } else if UITestConfig.motionSensorPermission == "denied" {
            state = .denied
        }
        return state
    }
}
