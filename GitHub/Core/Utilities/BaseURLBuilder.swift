import Foundation

class BaseURLBuilder: URLBuilder {
    var baseURL: String
    var path: String
    var method: HTTPMethod
    var headers: [String: String]
    var queryItems: [String: String]
    var body: Data?
    
    init(
        baseURL: String,
        path: String = "",
        method: HTTPMethod = .get,
        headers: [String: String] = [:],
        queryItems: [String: String] = [:],
        body: Data? = nil
    ) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.headers = headers
        self.queryItems = queryItems
        self.body = body
    }
}
