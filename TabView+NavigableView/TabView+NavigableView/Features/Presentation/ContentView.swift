//
//  ContentView.swift
//  TabView+NavigableView
//
//  Created by Alex Lin Segarra on 23/4/24.
//

import SwiftUI

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigationState: NavigationState

    var body: some View {
        VStack {
            Button("Go to Profile") {
                navigationState.push(route: .detail)
            }
        }
        .navigationTitle("Home View")
    }
}

struct DetailView: View {
    @EnvironmentObject var navigationState: NavigationState

    var body: some View {
        VStack {
            Button("Show modal") {
                navigationState.presentModal(route: .modal)
            }
        }
        .navigationTitle("Detail View")
    }
}

struct ProfileView: View {
    @EnvironmentObject var navigationState: NavigationState

    var body: some View {
        VStack {
            Text("Profile View")
            Button("Go to Profile") {
                navigationState.push(route: .settings)
            }
        }
        .navigationTitle("Profile View")
    }
}

struct SettingsView: View {
    @EnvironmentObject var navigationState: NavigationState

    var body: some View {
        VStack {
            Text("Settings View")
            Button("Go Deeper") {
                navigationState.popToRoot()
            }
        }
    }
}

struct ModalView: View {
    @EnvironmentObject var navigationState: NavigationState

    var body: some View {
        VStack {
            Text("Modal View")
            Button("Push modal 2") {
                navigationState.pushModal(route: .modal2)
            }
            
        }
    }
}

struct Modal2View: View {
    @EnvironmentObject var navigationState: NavigationState

    var body: some View {
        VStack {
            Text("Modal 2 View")
            Button("Close Modal") {
                navigationState.dismissModal()
            }
        }
    }
}
#Preview {
    HomeView()
}
