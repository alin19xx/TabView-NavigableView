//
//  RouteResolver.swift
//  TabView+NavigableView
//
//  Created by Alex Lin Segarra on 23/4/24.
//

import SwiftUI

struct RouteResolver: View {
    @EnvironmentObject var appContainer: AppContainer
    
    var route: Route

    var body: some View {
        switch route {
        case .home:
            HomeView(viewModel: appContainer.homeViewModel)
        case .profile:
            ProfileView()
        case .settings:
            SettingsView()
        case .modal:
            ModalView()
        case .modal2:
            Modal2View()
        case .detail:
            DetailView()
        }
    }
}
