//
//  StepCountRepository.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 07/01/2026.
//

import CoreMotion
import Combine

final class PedometerRepository: PedometerRepositoryProtocol {

    private let pedometer = CMPedometer()
    private let stepsSubject = CurrentValueSubject<Int, Never>(0)
    private var previousSteps = 0

    var stepsPublisher: AnyPublisher<Int, Never> {
        stepsSubject.eraseToAnyPublisher()
    }

    func start() {
        guard CMPedometer.isStepCountingAvailable() else { return }

        let startOfDay = Calendar.current.startOfDay(for: Date())

        pedometer.queryPedometerData(from: startOfDay, to: Date()) { [weak self] data, _ in
            guard let self, let data else { return }
            DispatchQueue.main.async {
                self.previousSteps = data.numberOfSteps.intValue
                self.stepsSubject.send(self.previousSteps)
            }
        }

        pedometer.startUpdates(from: Date()) { [weak self] data, _ in
            guard let self, let data else { return }
            DispatchQueue.main.async {
                let total = self.previousSteps + data.numberOfSteps.intValue
                self.stepsSubject.send(total)
            }
        }
    }

    func stop() {
        pedometer.stopUpdates()
    }
}
