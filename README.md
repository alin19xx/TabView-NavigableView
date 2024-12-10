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
### **2. NavigationState**
Handles the navigation stack for each tab:

```swift
class NavigationState: ObservableObject {
    @Published var routes: [Route] = []
    @Published var showModal: Bool = false
    @Published var modalRoute: Route?
    @Published var modalRoutes: [Route] = []

    func push(route: Route) { routes.append(route) }
    func popTo(_ route: Route) { ... }
    func popToRoot() { routes.removeAll() }
    func pop() { ... }
    func presentModal(route: Route) { ... }
    func dismissModal() { ... }
}

```

### **3. RouteResolver**

Resolves routes dynamically to the appropriate view:

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

### **4. AppContainer**

A centralized container for managing ViewModels:

```swift
class AppContainer: ObservableObject {
    @Published var homeViewModel = HomeViewModel()
    @Published var profileViewModel = ProfileViewModel(user: User(id: UUID(), name: "Default User", age: 25))
    ...
}
```
