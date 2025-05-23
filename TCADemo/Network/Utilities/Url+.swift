import Foundation

extension URL {
    func appendingQueryParameters(_ parameters: [String: String]) -> URL {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            fatalError("invalid URL")
        }
        var queryItems = components.queryItems ?? []
        queryItems += parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        components.queryItems = queryItems
        return components.url!
    }
}
