# TabView-NavigableView

## Overview
The application manages multiple navigation states for different tabs and supports modal presentations with individual navigation contexts.

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

### WIP
