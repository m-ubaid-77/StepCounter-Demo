//
//  UseCaseAssembly.swift
//  StepCounter
//
//  Created by AI Assistant on 05/01/2026.
//

import Swinject

/// Registers all use case dependencies.
final class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CheckMotionPermissionUseCase.self) { resolver in
            CheckMotionPermissionUseCase(
                provider: resolver.resolveRequired(MotionPermissionProviderProtocol.self)
            )
        }
        
        container.register(RequestMotionSensorPermissionUseCase.self) { resolver in
            RequestMotionSensorPermissionUseCase(
                provider: resolver.resolveRequired(MotionPermissionProviderProtocol.self)
            )
        }
    }
}

final class RouterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Router.self) { _ in Router.shared }
            .inObjectScope(.container)

        container.register(RouterProtocol.self) { resolver in
            resolver.resolveRequired(Router.self)
        }
    }
}
