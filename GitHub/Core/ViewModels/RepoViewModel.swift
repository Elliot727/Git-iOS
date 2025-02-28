import Foundation

@Observable
class RepoViewModel {
    var repositories: [Repository] = []
    var errorMessage: String? = nil
    private let gitHubService: GitHubService
    
    init(gitHubService: GitHubService) {
        self.gitHubService = gitHubService
    }
    
    func fetchRepositories() {
        Task {
            do {
                let fetchedRepositories = try await gitHubService.fetchRepositories()
                self.repositories = fetchedRepositories
            } catch {
                self.errorMessage = "Failed to fetch repositories: \(error.localizedDescription)"
            }
        }
    }

}
