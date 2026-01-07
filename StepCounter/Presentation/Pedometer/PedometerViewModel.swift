//
//  PedometerViewModel.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 02/01/2026.
//
import Combine
import Foundation

@MainActor
class PedometerViewModel: ObservableObject {
    @Published var steps: Int = 0
    
    private let repository: PedometerRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(repository: PedometerRepositoryProtocol) {
        self.repository = repository
        
        repository.stepsPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$steps)
    }
    
    func start() {
        repository.start()
    }
    
    func stop() {
        repository.stop()
    }
}
