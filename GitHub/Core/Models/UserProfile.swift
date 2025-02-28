import Foundation

struct UserProfile: Decodable {
    let login: String
    let name: String?
    let bio: String?
    let avatarUrl: String
    let location: String?
    let company: String?
    let websiteUrl: String?
    let twitterUsername: String?
    let followers: FollowerConnection
    let following: FollowingConnection
    
    struct FollowerConnection: Decodable {
        let totalCount: Int
    }
    
    struct FollowingConnection: Decodable {
        let totalCount: Int
    }
}


struct UserProfileData: Decodable {
    let user: UserProfile
}
