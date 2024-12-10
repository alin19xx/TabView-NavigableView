//
//  AppContainer.swift
//  TabView+NavigableView
//
//  Created by Alex Lin Segarra on 10/12/24.
//

import Foundation

class AppContainer: ObservableObject {
    @Published var homeViewModel = HomeViewModel()
    @Published var profileViewModel = ProfileViewModel(user: User(id: UUID(), name: "Default User", age: 25))
}
