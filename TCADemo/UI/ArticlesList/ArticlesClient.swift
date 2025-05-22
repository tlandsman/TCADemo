import ComposableArchitecture
import Foundation

struct ArticlesClient {
    typealias FetchResult = Result<[Article], APIError>
    var fetch: () async -> FetchResult
}


extension ArticlesClient: DependencyKey {
    static let liveValue = ArticlesClient(
        fetch: {
            do {
                let articles = try await TopStoriesService().fetchTopStories().map(Article.init)
                return .success(articles)
            } catch {
                return .failure(.fetchFailure)
            }
        }
    )
}

extension DependencyValues {
    var articlesClient: ArticlesClient {
        get {  self[ArticlesClient.self] }
        set {  self[ArticlesClient.self] = newValue }
    }
}
