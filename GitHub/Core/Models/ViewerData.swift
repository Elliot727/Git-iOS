import Foundation

struct ViewerData: Decodable {
    let viewer: Viewer
    
    struct Viewer: Decodable {
        let repositories: RepositoryConnection
        
        struct RepositoryConnection: Decodable {
            let nodes: [Repository]
        }
    }
}
