import Testing
import ComposableArchitecture
import Foundation

@testable import TCADemo


@MainActor
struct ArticlesListSystemTest {
    private typealias State = ArticlesListSystem.State
    private typealias Action = ArticlesListSystem.Action
    
    
    @Test
    func test_fetchArticleSuccess_updatesArticles() async throws {
        let mockFetch: () async -> ArticlesClient.FetchResult = {
            return .success([.mock1])
        }
    
        let store = TestStore(initialState: .initial, reducer: ArticlesListSystem.init, withDependencies: {
            $0.articlesClient.fetch = mockFetch
        })
        
        await store.send(.onAppear) {
            $0.isLoading = true
            $0.articles = []
            $0.errorMessage = nil
        }
        
        await store.receive(\.fetchResultRecieved) {
            $0.isLoading = false
            $0.articles = [.mock1]
        }
    }
    
    @Test
    func test_fetchArticleFailure_updatesErrorMessage() async throws {
        let mockFetch: () async -> ArticlesClient.FetchResult = {
            return .failure(APIError.fetchFailure)
        }
    
        let store = TestStore(initialState: .initial, reducer: ArticlesListSystem.init, withDependencies: {
            $0.articlesClient.fetch = mockFetch
        })
        
        await store.send(.onAppear) {
            $0.isLoading = true
            $0.articles = []
            $0.errorMessage = nil
        }
        
        await store.receive(\.fetchResultRecieved) {
            $0.isLoading = false
            $0.articles = []
            $0.errorMessage = "Something went wrong"
        }
    }
}




private extension Article {
    static let mock1 = Self(title: "title", byline: "by Jane Doe")
}

private extension ArticlesListSystem.State {
    static var initial = ArticlesListSystem.State()
}
