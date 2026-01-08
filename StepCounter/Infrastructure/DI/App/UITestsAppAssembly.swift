//
//  UIAppAssembly.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 06/01/2026.
//

import Swinject
import Foundation

final class UITestsAppAssembly: Assembly {
    func assemble(container: Container) {
        RouterAssembly().assemble(container: container)
        container.register(MotionPermissionProviderProtocol.self) { _ in
            var state: AppPermissionState = .authorized
            let permission = UITestConfig.motionSensorPermission
            if permission == "denied" {
                state = .denied
            } else if permission == "notDetermined" {
                state = .notDetermined
            } else if permission == "authorized" {
                state = .authorized
            }
            return FakeMotionPermissionProvider(state: state)
        }
        
        container.register(PedometerRepositoryProtocol.self) { _ in
            FakePedometerRepository()
        }
        
        UseCaseAssembly().assemble(container: container)
        ViewModelAssembly().assemble(container: container)
    }
}
