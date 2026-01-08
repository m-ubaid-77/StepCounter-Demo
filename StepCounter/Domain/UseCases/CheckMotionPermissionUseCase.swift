//
//  CheckMotionPermissionUseCase.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 03/01/2026.
//

final class CheckMotionPermissionUseCase: NoParamsUseCase {
    private let provider: MotionPermissionProviderProtocol

    init(provider: MotionPermissionProviderProtocol) { self.provider = provider }

    func execute() -> AppPermissionState {
        provider.checkStatus()
    }
}
