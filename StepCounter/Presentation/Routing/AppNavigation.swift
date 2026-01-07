//
//  AppNavigation.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 06/01/2026.
//

import Combine
import SwiftUI

struct AppNavigation: View {

    @EnvironmentObject private var router: Router

    var body: some View {
        NavigationStack(path: $router.path) {
            rootView
                .navigationDestination(for: Route.self) { route in
                    destination(for: route)
                }
        }
    }

    @ViewBuilder
    private var rootView: some View {
        destination(for: router.root)
    }

    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case .home:
            PedometerScreen(
                viewModel: AppDIContainer.shared.resolve(PedometerViewModel.self)
            )

        case .motionSensorPermission:
            MotionPermissionScreen(
                viewModel: AppDIContainer.shared.resolve(MotionPermissionViewModel.self)
            )

        case .splash:
            RootCoordinatorView(viewModel: AppDIContainer.shared.resolve(RootCoordinatorViewModel.self))
        }
    }
}


final class Router: ObservableObject, RouterProtocol {
    @Published var path: [Route] = []
    @Published var root: Route = .splash // root view

    static let shared = Router()
    
    func setRoot(_ route: Route) {
        root = route
        path.removeAll()
    }

    func replaceAll(with route: Route) {
        root = route
        path.removeAll()
    }

    func navigate(to route: Route) {
        path.append(route)
    }

    func goBack() {
        _ = path.popLast()
    }

    func resetToRoot() {
        path.removeAll()
    }
}

enum Route: Hashable {
    case home
    case motionSensorPermission
    case splash
}

protocol RouterProtocol: AnyObject {
    func navigate(to route: Route)
    func goBack()
    func resetToRoot()
    func replaceAll(with route: Route)
    func setRoot(_ route: Route)
}
