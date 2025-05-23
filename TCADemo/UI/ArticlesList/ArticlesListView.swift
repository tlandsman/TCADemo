import ComposableArchitecture
import SwiftUI

struct ArticlesListView: View {
    @Bindable var store: StoreOf<ArticlesListSystem>
    var body: some View {
        NavigationView {
            ListView(articles: store.articles)
                .onAppear {
                store.send(.onAppear)
            }
            .navigationTitle("Top Stories")
        }
    }
    
}

private struct ListView: View {
    let articles: [Article]
    var body: some View {
        List(articles) { article in
            Text(article.title)
        }
    }
}






#Preview {
    let initialState = ArticlesListSystem.State(articles: [.mock1, .mock2])
    let store: StoreOf<ArticlesListSystem> = Store(initialState: initialState, reducer: ArticlesListSystem.init)
    ArticlesListView(store: store)
}


extension Article: Identifiable {
    var id: String {
        title
    }
}

private extension Article {
    static let mock1 = Article(title: "Harvard Sues Trump Administration Over Move to Bar International Students", byline: "By Stephanie Saul")
    static let mock2 = Article(title: "Markets Drop on Trump’s Latest Tariff Threats", byline: "By Eshe Nelson")
}

