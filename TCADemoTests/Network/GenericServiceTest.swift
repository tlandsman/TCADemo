import Testing
import Foundation

@testable import TCADemo


struct GenericServiceTest {
    
    @Test
    func test_performRequest_InjectsApiKey() async throws {
        let clientSpy = HTTPClientSpy()
        let sut = GenericService<MockCodable>(client: clientSpy)
        _ = try await sut.performRequest(.any)
        
        if let request = clientSpy.request {
            let headers = request.allHTTPHeaderFields
            let apiKeyHeader = headers?["api-key"]
            #expect(apiKeyHeader != nil )
        } else {
            #expect(Bool(false), "Request was not made")
        }
    }
    
    @Test
    func test_givenCodableType_SuccessfullyDecodesItem() async throws {
        let clientSpy = HTTPClientSpy()
        let sut = GenericService<MockCodable>(client: clientSpy)
        let result = try await sut.performRequest(.any)
        #expect(result.title == "Mock Title")
    }

}


private struct MockCodable: Codable {
    let title: String
    
}

private class HTTPClientSpy: HTTPClient {
    var request: URLRequest?
    
    func perform(urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        request = urlRequest
        let response = HTTPURLResponse(url: urlRequest.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        return (mockData, response)
    }
        
}

private let mockData = """
{
    "title": "Mock Title"
}
""".data(using: .utf8)!
