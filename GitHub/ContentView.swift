import SwiftUI

struct ContentView: View {
    @Environment(RepoViewModel.self) var repoViewModel: RepoViewModel
    @Environment(UserViewModel.self) var userViewModel: UserViewModel
    var firstErrorMessage: String? {
        repoViewModel.errorMessage ?? userViewModel.errorMessage
    }
    var body: some View {
        NavigationStack{
            VStack{
                if let errorMessage = firstErrorMessage{
                    Text(errorMessage)
                        .font(.system(size: 20, weight: .semibold))
                }
                else{
                    if let user = userViewModel.user{
                        UserProfileView(user: user)
                            .padding()
                    }
                    if repoViewModel.repositories.isEmpty{
                        Spacer()
                        Text("No Repos")
                            .font(.headline)
                        Spacer()
                    }
                    else{
                        ReposView(repos: repoViewModel.repositories)
                    }
                }
            }
            .onAppear() {
                if(repoViewModel.repositories.isEmpty){
                    repoViewModel.fetchRepositories()
                }
                if(userViewModel.user == nil){
                    userViewModel.fetchUserProfile(username: "elliot727")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

