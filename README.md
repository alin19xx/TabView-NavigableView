# TabView-NavigableView

## Overview
This document outlines the structure and functionality of a SwiftUI application designed to demonstrate a robust navigation system. The application manages multiple navigation states for different tabs and supports modal presentations with individual navigation contexts.

## Key Components

### `TabView_NavigableViewApp`
- **Description**: The entry point of the SwiftUI application, setting up the main window group containing the `MainTabView`.

### `MainTabView`
- **Description**: Manages the tab view that contains all primary sections of the app. Each tab is backed by its own navigation state to maintain the user's navigation history independently.

### `NavigableView`
- **Description**: A generic view component that manages the navigation stack for its content. It integrates with `NavigationStack` to support forward and backward navigation within each tab or modal.

### `RouteResolver`
- **Description**: Determines the appropriate view to render based on the current navigation route. It simplifies the navigation logic by centralizing route handling.

### `NavigationState`
- **Description**: Manages the navigation routes for the application, including the ability to push new routes, pop to previous routes, and handle modal presentations.

### `Route`
- **Description**: An enumeration defining all navigable routes in the application, facilitating easy management and extension of the app's navigation paths.

## Features

- **Independent Tab Navigation**: Each tab maintains its own navigation stack, allowing seamless switching between tabs without losing state.
- **Dynamic View Rendering**: Based on the navigation state, `NavigableView` dynamically renders views using `RouteResolver`.
- **Modal Navigation**: Supports presenting modals with their own navigation stacks, ideal for complex sub-flows within modals.
- **Comprehensive State Management**: Through `NavigationState`, the app handles complex navigational interactions, ensuring robust state management across the user interface.

## Usage Examples

### Navigate to a View
To navigate to a different view within the same tab:
```swift
@EnvironmentObject var navigationState: NavigationState

Button("Go to Profile") {
    navigationState.push(route: .profile)
}
```

### Present a Modal
To display a modal with its own navigation context:
```swift
@EnvironmentObject var navigationState: NavigationState

Button("Show Settings Modal") {
    navigationState.presentModal(route: .settings)
}
```

### Navigation within a Modal
To navigate within a modal to a second level detail view:
```swift
@EnvironmentObject var navigationState: NavigationState

Button("Go to Detailed Settings") {
    navigationState.pushModal(route: .modal2)
}
```
