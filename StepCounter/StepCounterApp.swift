//
//  StepCounterApp.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 21/12/2025.
//
import SwiftUI

@main
struct StepCounterApp: App {
    @StateObject var router = AppDIContainer.shared.resolve(Router.self)
    init() {
        UIView.appearance().overrideUserInterfaceStyle = .light
    }
    
    var body: some Scene {
        WindowGroup {
            AppNavigation()
            .environmentObject(router)
        }
    }
}
