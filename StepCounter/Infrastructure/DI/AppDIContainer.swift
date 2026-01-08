//
//  AppDIContainer.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 05/01/2026.
//

import Swinject
import Foundation

final class AppDIContainer {

    static let shared = AppDIContainer()
    let resolver: Resolver
    let assembler: Assembler
    
    private init() {

        if ProcessInfo.isPreview {
            assembler = Assembler([PreviewAppAssembly()])
        } else if UITestConfig.isUITest {
            assembler = Assembler([UITestsAppAssembly()])
        } else {
            assembler = Assembler([AppAssembly()])
        }

        self.resolver = assembler.resolver
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        guard let resolved = assembler.resolver.resolve(type) else {
            fatalError("Dependency \(type) not registered!")
        }
        return resolved
    }
}

extension Resolver {
    func resolveRequired<Service>(_ serviceType: Service.Type) -> Service {
        guard let service = self.resolve(serviceType) else {
            fatalError("Dependency '\(serviceType)' not registered.")
        }
        return service
    }
}
