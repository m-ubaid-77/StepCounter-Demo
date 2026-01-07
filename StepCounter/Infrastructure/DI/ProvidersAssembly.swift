//
//  ProvidersAssembly.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 03/01/2026.
//
import Swinject

final class ProvidersAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MotionPermissionProviderProtocol.self) { _ in
            MotionPermissionProvider()
        }
        
        container.register(PedometerRepositoryProtocol.self) { _ in
            PedometerRepository()
        }
    }
}
