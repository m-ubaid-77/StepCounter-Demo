//
//  PreviewAppAssembly.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 05/01/2026.
//

import Swinject

final class PreviewAppAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MotionPermissionProviderProtocol.self) { _ in
            FakeMotionPermissionProvider(state: .authorized)
        }
        container.register(PedometerRepositoryProtocol.self) { _ in
            FakePedometerRepository()
        }
        RouterAssembly().assemble(container: container)
        UseCaseAssembly().assemble(container: container)
        ViewModelAssembly().assemble(container: container)
    }
}
