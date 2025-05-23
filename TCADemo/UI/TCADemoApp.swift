import SwiftUI
import ComposableArchitecture

@main
struct TCADemoApp: App {
    var body: some Scene {
        let store: StoreOf<ArticlesListSystem> = Store(initialState: .initial, reducer: ArticlesListSystem.init )
        WindowGroup {
            ArticlesListView(store: store)
        }
    }
}
