import Foundation

protocol HTTPClient {
    func perform(urlRequest: URLRequest) async throws -> (Data, URLResponse)
}


// Live URL Session implementation

extension URLSession: HTTPClient {
    func perform(urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        let (data, response) = try await self.data(for: urlRequest)
         print(">>> data \(String(describing: data.prettyPrintedJSONString))")
        return try await self.data(for: urlRequest)
    }
}
