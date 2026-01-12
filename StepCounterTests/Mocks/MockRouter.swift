//
//  MockRouter.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 12/01/2026.
//


final class MockRouter: RouterProtocol {

    private(set) var lastRoute = Route.motionSensorPermission

    private(set) var navigateCalled = false
    private(set) var navigateLastRoute: Route?

    func setRoot(_ route: Route) {
        lastRoute = route
    }

    func replaceAll(with route: Route) {
        setRoot(route)
    }

    func navigate(to route: Route) {
        navigateCalled = true
        navigateLastRoute = route
    }

    func goBack() {}
    func resetToRoot() {}
}
