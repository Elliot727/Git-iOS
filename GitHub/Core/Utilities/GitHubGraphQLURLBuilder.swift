import Foundation

class GitHubGraphQLURLBuilder: BaseURLBuilder, URLRequestConvertible, AuthenticatedURLBuilder, GraphQLURLBuilder {
    init(baseURL: String = "https://api.github.com") {
        super.init(
            baseURL: baseURL,
            path: "/graphql",
            method: .post,
            headers: [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        )
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL) else {
            throw URLBuilderError.invalidBaseURL
        }
        
        let urlWithPath = url.appendingPathComponent(path)
        
        var components = URLComponents(url: urlWithPath, resolvingAgainstBaseURL: true)
        
        if !queryItems.isEmpty {
            components?.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let finalURL = components?.url else {
            throw URLBuilderError.invalidPath
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        if let bodyData = body {
            request.httpBody = bodyData
        }
        
        return request
    }
    
    func withToken(_ token: String, prefix: String? = "bearer") -> Self {
        let tokenValue = prefix != nil ? "\(prefix!) \(token)" : token
        headers["Authorization"] = tokenValue
        return self
    }
    
    func withBasicAuth(username: String, password: String) -> Self {
        if let authData = "\(username):\(password)".data(using: .utf8) {
            let base64Auth = authData.base64EncodedString()
            headers["Authorization"] = "Basic \(base64Auth)"
        }
        return self
    }
    
    func withQuery(_ query: String, variables: [String: Any]? = nil) -> Self {
        var payload: [String: Any] = ["query": query]
        
        if let variables = variables {
            payload["variables"] = variables
        }
        
        do {
            body = try JSONSerialization.data(withJSONObject: payload)
        } catch {
            print("Error serializing GraphQL payload: \(error)")
        }
        
        return self
    }
    
    func withOperation(name: String) -> Self {
        if var payload = try? JSONSerialization.jsonObject(with: body ?? Data(), options: []) as? [String: Any] {
            payload["operationName"] = name
            
            do {
                body = try JSONSerialization.data(withJSONObject: payload)
            } catch {
                print("Error adding operation name: \(error)")
            }
        }
        
        return self
    }
}
