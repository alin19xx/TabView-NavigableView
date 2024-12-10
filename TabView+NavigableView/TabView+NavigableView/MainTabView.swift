//
//  MainTabView.swift
//  TabView+NavigableView
//
//  Created by Alex Lin Segarra on 23/4/24.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var appContainer = AppContainer()
    
    @StateObject private var homeNavState = NavigationState()
    @StateObject private var profileNavState = NavigationState()
    
    @State private var selectedTab: String = "home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigableView(content: HomeView(viewModel: appContainer.homeViewModel),
                          navigationState: homeNavState)
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag("home")
            
            NavigableView(content: ProfileView(),
                          navigationState: profileNavState)
            .tabItem {
                Label("Profile", systemImage: "person")
            }
            .tag("profile")
        }
        .environmentObject(appContainer) // Inject the container
    }
}

#Preview {
    MainTabView()
}
