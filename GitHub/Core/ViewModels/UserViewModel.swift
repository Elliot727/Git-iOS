import Foundation

@Observable
class UserViewModel{
    
    var user:UserProfile?
    var errorMessage: String? = nil
    private let gitHubService: GitHubService
    
    init(gitHubService: GitHubService) {
        self.gitHubService = gitHubService
    }
    
    func fetchUserProfile(username: String) {
        Task {
            do {
                let user = try await gitHubService.fetchUserProfile(username: username)
                self.user = user
            } catch {
                self.errorMessage = "Failed to fetch user: \(error.localizedDescription)"
            }
        }
    }
}
