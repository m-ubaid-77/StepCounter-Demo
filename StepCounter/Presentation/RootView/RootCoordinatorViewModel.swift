//
//  RootCoordinatorViewModel.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 07/01/2026.
//
import Combine

final class RootCoordinatorViewModel: ObservableObject {

    @Published var state: Route = .splash

    private let checkPermission: CheckMotionPermissionUseCase

    init(checkPermission: CheckMotionPermissionUseCase) {
        self.checkPermission = checkPermission
    }

    func decideInitialFlow() {
        let status = checkPermission.execute()
        state = (status == .authorized) ? .home : .motionSensorPermission
    }

    func refreshOnForeground() {
        decideInitialFlow()
    }
}
