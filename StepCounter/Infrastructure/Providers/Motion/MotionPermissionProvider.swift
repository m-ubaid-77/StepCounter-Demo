//
//  MotionPermissionService.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 03/01/2026.
//
import CoreMotion

final class MotionPermissionProvider: MotionPermissionProviderProtocol {
    
    private let pedometer = CMPedometer()
    
    func checkStatus() -> AppPermissionState {
        switch CMPedometer.authorizationStatus() {
        case .authorized: return .authorized
        case .denied: return .denied
        case .restricted: return .restricted
        case .notDetermined: return .notDetermined
        @unknown default: return .denied
        }
    }
    
    func requestPermission() async -> AppPermissionState {
        await withCheckedContinuation { continuation in
            let now = Date()
            pedometer.queryPedometerData(from: now, to: now) { _, error in
                let state: AppPermissionState
                if let error = error as NSError?, error.code == Int(CMErrorMotionActivityNotAuthorized.rawValue) {
                    state = .denied
                } else {
                    state = self.checkStatus()
                }
                continuation.resume(returning: state)
            }
        }
    }
}
