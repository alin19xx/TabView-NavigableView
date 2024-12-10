# SwiftUI Navigable TabView with State Management

This project demonstrates a scalable, clean, and reactive architecture for managing navigation within a `TabView` in SwiftUI. Each tab has its own navigation stack and supports modal presentation, while maintaining separate state management for each view.

---

## **Features**

- **Independent Navigation State**: Each tab maintains its own navigation stack using the `NavigationState` class.
- **Modular Design**: Views are independent and interact with their respective `ViewModels`.
- **Dynamic Routing**: Navigation to routes (`Route`) is resolved using `RouteResolver`.
- **Reactive State**: State updates are automatically reflected in the views, ensuring a seamless user experience.
- **Scalable and Testable**: The architecture follows principles of Clean Architecture, making it easy to add new features and write unit tests.

---

## **Project Structure**

### **1. MainTabView**
The entry point of the app, managing the `TabView` with independent navigation states for each tab:

```swift
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
        .environmentObject(appContainer) // Inject the AppContainer for shared state
    }
}
```

### **2. NavigableView**

The `NavigableView` is a reusable wrapper that provides a dedicated `NavigationStack` for managing routes and modal presentations. Each `NavigableView` is connected to a specific `NavigationState`, allowing independent navigation within tabs or modals.

```swift
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
```

### **3. NavigationState**
Manages the navigation stack for each tab and modal. This class provides functions to control navigation hierarchies, ensuring that navigation flows are independent and reusable across tabs.

```swift
class NavigationState: ObservableObject {
    @Published var routes: [Route] = []            // Stack of routes for in-tab navigation
    @Published var showModal: Bool = false         // Controls modal visibility
    @Published var modalRoute: Route?              // Stores the current modal route
    @Published var modalRoutes: [Route] = []       // Stack of routes inside a modal

    func push(route: Route) { routes.append(route) }
    func popTo(_ route: Route) { ... }
    func popToRoot() { routes.removeAll() }
    func pop() { ... }
    func presentModal(route: Route) { ... }
    func dismissModal() { ... }
}

```

### **4. RouteResolver**

Resolves navigation routes dynamically to the appropriate view. This ensures that navigation is modular and scalable, as each route is mapped to its corresponding view.

```swift
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
```

### **5. AppContainer**

A centralized container for managing shared ViewModels and state across the app. This pattern ensures a single source of truth for app-wide dependencies while keeping the code modular and testable.

```swift
class AppContainer: ObservableObject {
    @Published var homeViewModel = HomeViewModel()
    @Published var profileViewModel = ProfileViewModel(user: User(id: UUID(), name: "Default User", age: 25))
    ...
}
```
