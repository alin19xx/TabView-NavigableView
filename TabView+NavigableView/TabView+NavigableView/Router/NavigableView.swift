//
//  NavigableView.swift
//  TabView+NavigableView
//
//  Created by Alex Lin Segarra on 23/4/24.
//

import SwiftUI

struct NavigableView<Content: View>: View {
    let content: Content
    @ObservedObject var navigationState: NavigationState
    
    var body: some View {
        NavigationStack(path: $navigationState.routes) {
            content
                .navigationDestination(for: Route.self) { route in
                    RouteResolver(route: route)
                }
        }
        .environmentObject(navigationState)
        .sheet(isPresented: $navigationState.showModal) {
            NavigationStack(path: $navigationState.modalRoutes) {
                if let route = navigationState.modalRoute {
                    RouteResolver(route: route)
                        .navigationDestination(for: Route.self) { route in
                            RouteResolver(route: route)
                        }
                }
            }
            .environmentObject(navigationState)
        }
    }
}
