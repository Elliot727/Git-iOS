import Foundation

struct Repository: Decodable, Hashable {
    let name: String
    let description: String?
    let stargazerCount: Int
    let owner: Owner
    let forkCount: Int
    let createdAt: String
    let updatedAt: String
    let pushedAt: String
    let isFork: Bool
    let isArchived: Bool
    let isEmpty: Bool?
    let isPrivate: Bool?
    let isTemplate: Bool?
    let isDisabled: Bool?
    let licenseInfo: License?
    let url: String
    let homepageUrl: String?
    let defaultBranchRef: Branch
    let languages: LanguageConnection
    let primaryLanguage: Language?
    let watchers: CountConnection?
    let issues: CountConnection?
    let pullRequests: CountConnection?
    let releases: CountConnection?
    let diskUsage: Int?
    let hasWikiEnabled: Bool?
    let hasDiscussionsEnabled: Bool?
    let codeOfConduct: CodeOfConduct?
    let openGraphImageUrl: String?
    let isInOrganization: Bool?
    let mentionableUsers: UserConnection?
    let collaborators: UserConnection?
    let vulnerabilityAlerts: CountConnection?
    let packages: CountConnection?
    let mirrorUrl: String?
    let projectsUrl: String?
    
    struct Owner: Decodable, Hashable {
        let login: String
        let avatarUrl: String?
        let url: String?
    }
    
    struct LanguageConnection: Decodable, Hashable {
        let nodes: [Language]
        let totalCount: Int?
        let totalSize: Int?
    }
    
    struct Language: Decodable, Hashable {
        let name: String
        let color: String?
    }
    
    struct License: Decodable, Hashable {
        let name: String
        let spdxId: String?
        let url: String?
    }
    
    struct Branch: Decodable, Hashable {
        let name: String
        let target: BranchTarget?
    }
    
    struct BranchTarget: Decodable, Hashable {
        let history: CommitHistory?
    }
    
    struct CommitHistory: Decodable, Hashable {
        let nodes: [Commit]
    }
    
    struct Commit: Decodable, Hashable {
        let committedDate: String
        let message: String
    }
    
    struct CodeOfConduct: Decodable, Hashable {
        let name: String
        let url: String?
    }
    
    struct UserConnection: Decodable, Hashable {
        let totalCount: Int
        let nodes: [User]?
    }
    
    struct User: Decodable, Hashable {
        let login: String
        let avatarUrl: String?
    }
    
    struct CountConnection: Decodable, Hashable {
        let totalCount: Int
    }
}
