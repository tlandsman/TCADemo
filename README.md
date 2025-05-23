# NYT Top Stories – TCA Example App

This project is a simple demonstration app built using The Composable Architecture (TCA). It showcases how to apply TCA principles in a real-world scenario by fetching and displaying a list of top stories from the New York Times.


## 🏗️ App Architecture


Key Principles of TCA in This Demo
* State Management: All app state is centralized in a single source of truth, making it easy to understand and debug.

* Unidirectional Data Flow: The app strictly follows a predictable data flow — Action → Reducer → State.

* Modularity: Features are built in isolation using reusable and testable components. This enables better code organization and scalability.

* Testability: Reducers and side effects are isolated and test-friendly, making unit testing straightforward.

* Dependency Injection: External dependencies (like API clients) are injected via the environment, improving testability and flexibility.


## 🚀 Why TCA?


This architecture is ideal for apps that need to grow in complexity while maintaining a clean, testable codebase. 
In this demo, you'll see how TCA encourages clear separation of concerns and scales from a single screen to an entire application.



## 🚀 Getting Started


Clone the repo
Add your NYT API key to the Environment file
Open the project in Xcode and run the app on a simulator or device.



## 🙌 Acknowledgements


[Point-Free for The Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture)

[New York Times API](https://developer.nytimes.com/docs/top-stories-product/1/overview)

