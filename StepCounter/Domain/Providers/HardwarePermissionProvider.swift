//
//  HardwarePermissionProvider.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 03/01/2026.
//

protocol HardwarePermissionProvider {
    func checkStatus() -> AppPermissionState
    func requestPermission() async -> AppPermissionState
}
