//
//  PedometerViewModelTests.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 12/01/2026.
//

import XCTest
import Combine
@testable import StepCounter

@MainActor
final class PedometerViewModelTests: XCTestCase {

    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Test 1: Initial State

    func test_initialSteps_isZero() async {
        let repository = MockPedometerRepository()
        let viewModel = PedometerViewModel(repository: repository)

        XCTAssertEqual(viewModel.steps, 0)
    }

    // MARK: - Test 2: Steps Update from Repository

    func test_stepsUpdate_whenRepositoryEmitsSteps() async {
        let repository = MockPedometerRepository()
        let viewModel = PedometerViewModel(repository: repository)

        let expectation = XCTestExpectation(description: "Steps updated")

        viewModel.$steps
            .dropFirst()
            .sink { steps in
                XCTAssertEqual(steps, 1200)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        repository.setSteps(1200)

        await fulfillment(of: [expectation], timeout: 1)
    }


    // MARK: - Test 3: Multiple Step Updates

    func test_stepsUpdate_multipleTimes() async {
        let repository = MockPedometerRepository()
        let viewModel = PedometerViewModel(repository: repository)

        let expectation = XCTestExpectation(description: "Multiple updates")
        expectation.expectedFulfillmentCount = 3

        var receivedSteps: [Int] = []

        viewModel.$steps
            .dropFirst()
            .sink { steps in
                receivedSteps.append(steps)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        repository.setSteps(100)
        repository.setSteps(500)
        repository.setSteps(1500)

        XCTAssertEqual(receivedSteps, [100, 500, 1500])
    }
}
