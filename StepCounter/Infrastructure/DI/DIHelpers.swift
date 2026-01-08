//
//  DIHelpers.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 05/01/2026.
//

import Swinject
import Foundation

func assembleAll(
    _ container: Container,
    _ assemblies: Assembly...
) {
    assemblies.forEach { assembly in
        assembly.assemble(container: container)
    }
}

extension ProcessInfo {
    static var isPreview: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}

struct UITestConfig {
    static let isUITest = CommandLine.arguments.contains("--ui-testing")
    static let motionSensorPermission = ProcessInfo.processInfo.environment["motion-sensor-permission"]
    
}
