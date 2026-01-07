//
//  MotionPermissionViewModel.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 06/01/2026.
//
import Combine
import Foundation

@MainActor
class MotionPermissionViewModel: ObservableObject {
    
    private let requestPermissionUseCase: RequestMotionSensorPermissionUseCase
    private let checkPermissionUseCase: CheckMotionPermissionUseCase
    private let router: Router
    
    init(requestPermissionUseCase: RequestMotionSensorPermissionUseCase,
         checkPermissionUseCase: CheckMotionPermissionUseCase,
         router: Router
    ) {
        self.requestPermissionUseCase = requestPermissionUseCase
        self.checkPermissionUseCase = checkPermissionUseCase
        self.router = router
    }
    
    func allowAccessButtonPressed() async {
        let permissionState = await requestPermissionUseCase.execute()
        switch permissionState {
        case .denied, .restricted:
            openAppSettings()
        case .authorized:
            router.setRoot(.home)
        default:
            break
        }
    }
}
