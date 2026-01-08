//
//  ViewModelAssembly.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 05/01/2026.
//
import Swinject

final class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PedometerViewModel.self) { resolver in
            PedometerViewModel(
                repository: resolver.resolveRequired(PedometerRepositoryProtocol.self)
            )
        }
        
        container.register(MotionPermissionViewModel.self) { resolver in
            MotionPermissionViewModel(
                requestPermissionUseCase: resolver.resolveRequired(RequestMotionSensorPermissionUseCase.self),
                checkPermissionUseCase: resolver.resolveRequired(CheckMotionPermissionUseCase.self),
                router: resolver.resolveRequired(Router.self)
            )
        }
        
        container.register(RootCoordinatorViewModel.self) { resolver in
            RootCoordinatorViewModel(
                checkPermission: resolver.resolveRequired(CheckMotionPermissionUseCase.self)
            )
        }
    }
}
