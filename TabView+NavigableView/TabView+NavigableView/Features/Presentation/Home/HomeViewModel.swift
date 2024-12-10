//
//  HomeViewModel.swift
//  TabView+NavigableView
//
//  Created by Alex Lin Segarra on 10/12/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var users: [User] = [
        User(id: UUID(), name: "Angelica", age: 29),
        User(id: UUID(), name: "Alex", age: 28)
    ]
    
    func addUser(name: String, age: Int) {
        let newUser = User(id: UUID(), name: name, age: age)
        users.append(newUser)
    }
}
