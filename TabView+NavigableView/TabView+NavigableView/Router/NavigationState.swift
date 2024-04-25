//
//  NavigationState.swift
//  TabView+NavigableView
//
//  Created by Alex Lin Segarra on 23/4/24.
//

import Foundation

class NavigationState: ObservableObject {
    @Published var routes: [Route] = []
    @Published var showModal: Bool = false
    @Published var modalRoute: Route?
    @Published var modalRoutes: [Route] = []

    func push(route: Route) {
        routes.append(route)
    }

    func popTo(_ route: Route) {
        guard let index = routes.firstIndex(of: route) else { return }
        routes = Array(routes.prefix(upTo: index + 1))
    }

    func popToRoot() {
        routes.removeAll()
    }

    func pop() {
        if !routes.isEmpty {
            routes.removeLast()
        }
    }

    func presentModal(route: Route) {
        modalRoute = route
        showModal = true
    }

    func pushModal(route: Route) {
        modalRoutes.append(route)
    }

    func popModal() {
        if !modalRoutes.isEmpty {
            modalRoutes.removeLast()
        }
    }

    func dismissModal() {
        showModal = false
        modalRoute = nil
        modalRoutes.removeAll()
    }
}
