import Foundation

protocol URLBuilder {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var queryItems: [String: String] { get }
    var body: Data? { get }
}

protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}

protocol AuthenticatedURLBuilder {
    func withToken(_ token: String, prefix: String?) -> Self
    func withBasicAuth(username: String, password: String) -> Self
}

protocol GraphQLURLBuilder {
    func withQuery(_ query: String, variables: [String: Any]?) -> Self
    func withOperation(name: String) -> Self
}

protocol ResponseHandler {
    associatedtype ResponseType
    func decode(data: Data) throws -> ResponseType
}
