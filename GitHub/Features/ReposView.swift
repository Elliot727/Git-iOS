import SwiftUI

struct ReposView: View {
    var repos:[Repository]
    var body: some View {
        ScrollView{
            VStack{
                ForEach(repos.sorted(by: {$0.createdAt > $1.createdAt}), id: \.self){repo in
                    NavigationLink {
                        RepoDetailView(repo: repo)
                            .navigationBarBackButtonHidden()
                    } label: {
                        VStack{
                            RepoRow(repo: repo)
                            Divider()
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}
