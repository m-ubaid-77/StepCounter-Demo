//
//  MockPedometerRepository.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 07/01/2026.
//

import Combine

final class MockPedometerRepository: PedometerRepositoryProtocol {

    private let stepsSubject = CurrentValueSubject<Int, Never>(0)

    private(set) var startCalled = false
    private(set) var stopCalled = false

    var stepsPublisher: AnyPublisher<Int, Never> {
        stepsSubject.eraseToAnyPublisher()
    }

    func start() {
        startCalled = true
    }

    func stop() {
        stopCalled = true
    }

    func setSteps(_ steps: Int) {
        stepsSubject.send(steps)
    }
}
