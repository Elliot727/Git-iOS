import Foundation

class GraphQLResponseHandler<T: Decodable>: ResponseHandler {
    typealias ResponseType = T
    
    struct GraphQLResponse<U: Decodable>: Decodable {
        let data: U?
        let errors: [GraphQLError]?
    }
    
    struct GraphQLError: Decodable {
        let message: String
        let locations: [ErrorLocation]?
        let path: [String]?
        
        struct ErrorLocation: Decodable {
            let line: Int
            let column: Int
        }
    }
    
    func decode(data: Data) throws -> T {
        let decoder = JSONDecoder()
        let response = try decoder.decode(GraphQLResponse<T>.self, from: data)
        
        if let errors = response.errors, !errors.isEmpty {
            throw NSError(domain: "GraphQLError", code: 422, userInfo: [
                NSLocalizedDescriptionKey: errors.map { $0.message }.joined(separator: ", ")
            ])
        }
        
        guard let data = response.data else {
            throw NSError(domain: "GraphQLError", code: 500, userInfo: [
                NSLocalizedDescriptionKey: "No data returned"
            ])
        }
        
        return data
    }
}
