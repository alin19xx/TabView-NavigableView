//
//  ProfileViewModel.swift
//  TabView+NavigableView
//
//  Created by Alex Lin Segarra on 10/12/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
