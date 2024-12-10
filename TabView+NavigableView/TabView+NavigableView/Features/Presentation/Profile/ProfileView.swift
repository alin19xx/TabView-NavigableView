//
//  ProfileView.swift
//  TabView+NavigableView
//
//  Created by Alex Lin Segarra on 10/12/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appContainer: AppContainer
    @EnvironmentObject var navigationState: NavigationState

    var body: some View {
        VStack {
            Text("Name: \(appContainer.profileViewModel.user.name)")
            Text("Age: \(appContainer.profileViewModel.user.age)")
        }
        .navigationTitle("Profile")
    }
}

#Preview {
    ProfileView()
        .environmentObject(AppContainer())
        .environmentObject(NavigationState())
}
