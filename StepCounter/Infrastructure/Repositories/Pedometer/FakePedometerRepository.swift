//
//  FakePedometerRepository.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 07/01/2026.
//

import Combine
import Foundation

final class FakePedometerRepository: PedometerRepositoryProtocol {
    
    private let stepsSubject = CurrentValueSubject<Int, Never>(0)
    private var timer: Timer?
    
    var stepsPublisher: AnyPublisher<Int, Never> {
        stepsSubject.eraseToAnyPublisher()
    }
    
    func start() {
        // Simulate step count increasing every second
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            let nextStep = self.stepsSubject.value + Int.random(in: 1...5)
            self.stepsSubject.send(nextStep)
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
}
