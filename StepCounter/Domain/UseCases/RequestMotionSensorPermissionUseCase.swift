//
//  RequestMotionSensorPermissionUseCase.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 06/01/2026.
//

final class RequestMotionSensorPermissionUseCase: NoParamsUseCase {
    private let provider: MotionPermissionProviderProtocol

    init(provider: MotionPermissionProviderProtocol) { self.provider = provider }

    func execute() async -> AppPermissionState {
        await provider.requestPermission()
    }
}
