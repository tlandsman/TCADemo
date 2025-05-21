import Foundation
@testable import TCADemo


typealias ClientResult = Result<(Data, URLResponse), Error>

struct HTTPClientStub: HTTPClient {
    let result: ClientResult
    
    func perform(urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}
