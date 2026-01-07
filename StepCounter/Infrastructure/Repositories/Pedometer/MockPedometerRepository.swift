//
//  MockPedometerRepository.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 07/01/2026.
//

import Combine

final class MockPedometerRepository: PedometerRepositoryProtocol {
    
    private let stepsSubject = CurrentValueSubject<Int, Never>(0)
    
    var stepsPublisher: AnyPublisher<Int, Never> {
        stepsSubject.eraseToAnyPublisher()
    }
    
    // Start/stop do nothing (controlled manually)
    func start() {}
    func stop() {}
    
    // Programmatically set steps in tests
    func setSteps(_ steps: Int) {
        stepsSubject.send(steps)
    }
}
