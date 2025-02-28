import SwiftUI

@main
struct GitHubApp: App {
    var githubService = GitHubService(token: "PAT")
    @State private var repoViewModel:RepoViewModel
    @State private var userViewModel:UserViewModel
    
    init() {
        repoViewModel = RepoViewModel(gitHubService: githubService)
        userViewModel = UserViewModel(gitHubService: githubService)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(repoViewModel)
                .environment(userViewModel)
        }
    }
}
