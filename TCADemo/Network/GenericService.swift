//
//  GenericService.swift
//  TCADemo
//
//  Created by Tanya Landsman on 5/21/25.
//


import Foundation

/*
 Generic Service to handle network requests
 This service can be reused for any Codable response type
 It takes a generic type parameter T, which must conform to Codable
 The service performs a network request and decodes the response into the specified type T
 It uses the URLSession as the default HTTP client and injects the API key into the request headers
 */

struct GenericService<T: Codable> {
    private let client: HTTPClient
    private let apiKey: String = Environment.apiKey
    
    init(client: HTTPClient = URLSession.shared) {
        self.client = client
    }
    
    func performRequest(_ url: URL) async throws -> T {
        let url = url.appendingQueryParameters(["api-key" : apiKey])
        let request = URLRequest(url: url)
        
        let (data, _) = try await client.perform(urlRequest: request)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let response = try decoder.decode(T.self, from: data)
        
        return response
    }
    
}
