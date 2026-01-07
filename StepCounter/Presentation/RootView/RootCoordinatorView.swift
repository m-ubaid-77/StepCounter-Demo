//
//  RootCoordinatorView.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 07/01/2026.
//
import SwiftUI

struct RootCoordinatorView: View {
    @EnvironmentObject private var router: Router
    @Environment(\.scenePhase) private var scenePhase
    @ObservedObject var viewModel: RootCoordinatorViewModel

    var body: some View {
        SplashView()
            .onAppear {
                viewModel.decideInitialFlow()
            }
            .onChange(of: viewModel.state) { state in
                switch state {
                case .motionSensorPermission:
                    router.setRoot(.motionSensorPermission)
                case .home:
                    router.setRoot(.home)
                case .splash:
                    break
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .active {
                    viewModel.refreshOnForeground()
                }
            }
    }
}

#Preview {
    RootCoordinatorView(
        viewModel: AppDIContainer.shared.resolve(RootCoordinatorViewModel.self)
    )
    .environmentObject(AppDIContainer.shared.resolve(Router.self))
}
