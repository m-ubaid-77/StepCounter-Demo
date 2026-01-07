//
//  AppAssembly.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 03/01/2026.
//

import Swinject

final class AppAssembly: Assembly {
    func assemble(container: Container) {
        assembleAll(
            container,
            RouterAssembly(),
            ProvidersAssembly(),
            UseCaseAssembly(),
            ViewModelAssembly()
        )
    }
}
