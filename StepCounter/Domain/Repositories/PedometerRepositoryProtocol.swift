//
//  PedometerRepositoryProtocol.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 07/01/2026.
//

import Combine

protocol PedometerRepositoryProtocol {
    var stepsPublisher: AnyPublisher<Int, Never> { get }
    func start()
    func stop()
}
