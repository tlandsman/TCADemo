//
//  TopStoriesSystem.swift
//  TCADemo
//
//  Created by Tanya Landsman on 5/22/25.
//

import ComposableArchitecture


@Reducer
struct ArticlesListSystem {
    @ObservableState
    struct State: Equatable {
        var articles: [Article] = []
        var isLoading: Bool = false
        var errorMessage: String?
    }
    
    enum Action: Equatable {
        case onAppear
        case fetchResultRecieved(result: ArticlesClient.FetchResult)
    }
    
    @Dependency(\.articlesClient) var articlesClient
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.isLoading = true
                return .run { send in
                    let result = await self.articlesClient.fetch()
                    await send(.fetchResultRecieved(result: result))
                }
            case .fetchResultRecieved(result: let result):
                state.isLoading = false
                switch result {
                case .success(let articles):
                    state.articles = articles
                case .failure:
                    state.errorMessage = "Something went wrong"
                }
                return .none
            }
        }
    }
}
