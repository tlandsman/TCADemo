//
//  TopStoriesService.swift
//  TCADemo
//
//  Created by Tanya Landsman on 5/21/25.
//
import Foundation

struct TopStoriesService {
    private let baseURL = URL(string: "https://api.nytimes.com/svc/topstories/v2/home.json")!

    private let service: GenericService<APIArticlesResponse>
    
    init(client: HTTPClient = URLSession.shared) {
        self.service = GenericService<APIArticlesResponse>(client: client)
    }
    
    func fetchTopStories() async throws -> [APIArticle] {
        let response: APIArticlesResponse = try await service.performRequest(baseURL)
        return response.results
    }

}
