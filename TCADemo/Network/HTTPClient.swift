import Foundation

protocol HTTPClient {
    func perform(urlRequest: URLRequest) async throws -> (Data, URLResponse)
}


// Live URL Session implementation

extension URLSession: HTTPClient {
    func perform(urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        return try await self.data(for: urlRequest)
    }
}
