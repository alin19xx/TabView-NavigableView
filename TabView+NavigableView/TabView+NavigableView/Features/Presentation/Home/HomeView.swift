//
//  HomeView.swift
//  TabView+NavigableView
//
//  Created by Alex Lin Segarra on 10/12/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appContainer: AppContainer
    @EnvironmentObject var navigationState: NavigationState
    
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack {
            List(viewModel.users) { user in
                Button(action: {
                    appContainer.profileViewModel.user = user
                    navigationState.push(route: .profile)
                }) {
                    Text(user.name)
                }
            }
            
            Button("Add Random User") {
                viewModel.addUser(name: "User \(Int.random(in: 1...100))", age: Int.random(in: 18...50))
            }
        }
        .navigationTitle("Home")
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
        .environmentObject(NavigationState())
        .environmentObject(AppContainer())
}
