//
//  ContentView.swift
//  TabView+NavigableView
//
//  Created by Alex Lin Segarra on 23/4/24.
//

import SwiftUI

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
//#Preview {
//    HomeView()
//        .environmentObject(NavigationState())
//}
