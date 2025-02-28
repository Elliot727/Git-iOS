import SwiftUI

struct RepoDetailView: View {
    var repo:Repository
    @Environment(\.dismiss) var dismiss
    @State private var showFullDescription = false
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 18))
                        .foregroundStyle(.black)
                }
                Spacer()
                Text(repo.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .lineLimit(1)
                    .truncationMode(.tail)
                Spacer()
                if let url  = URL(string: repo.url){
                    Link(destination: url) {
                        Image(systemName: "link")
                    }
                }
            }
            .padding()
            ScrollView{
                VStack{
                    SectionHeader(title: "Collaborators")
                    CollaboratorsRow(users: repo.collaborators?.nodes ?? [])
                    SectionHeader(title: "Languages")
                    LanguagesRow(languages: repo.languages.nodes)
                    
                    HStack(spacing: 16) {
                        StatBadge(icon: "star.fill", count: repo.stargazerCount)
                        StatBadge(icon: "tuningfork", count: repo.forkCount)
                        
                        if let watchCount = repo.watchers?.totalCount {
                            StatBadge(icon: "eye.fill", count: watchCount)
                        }
                        
                        Spacer()
                    }
                    .padding([.top, .horizontal])
                    SectionHeader(title: "Details")
                    VStack(spacing: 12) {
                        if let size = repo.diskUsage?.formattedSize() {
                            StatsRow(icon: "externaldrive", title: "Size", value: size)
                        }
                        
                        if let date = repo.createdAt.toHumanReadableDate() {
                            StatsRow(icon: "calendar", title: "Created", value: date)
                        }
                        
                        if repo.hasWikiEnabled == true {
                            StatsRow(icon: "book.closed", title: "Wiki", value: "Enabled")
                        }
                        
                        
                    }
                    if let description = repo.description, !description.isEmpty {
                        SectionHeader(title: "Description")
                        VStack(alignment: .leading, spacing: 8) {
                            Text(description)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .lineLimit(showFullDescription ? nil : 3)
                                .padding(.horizontal)
                                .padding(.top, 2)
                            
                            if description.count > 150 {
                                Button(action: {
                                    showFullDescription.toggle()
                                }) {
                                    Text(showFullDescription ? "Show less" : "Show more")
                                        .font(.footnote)
                                        .foregroundStyle(.blue)
                                }
                                .padding(.leading)
                            }
                        }
                    }
                    SectionHeader(title: "Branch")
                   
                        StatsRow(icon: "arrow.trianglehead.branch", title: "Default Branch", value: repo.defaultBranchRef.name)
                    
                    if let commits = repo.defaultBranchRef.target?.history?.nodes {
                        SectionHeader(title: "Recent Commits")
                        ForEach(commits, id: \.committedDate) { commit in
                            VStack(alignment: .leading) {
                                Text(commit.message)
                                    .font(.subheadline)
                                Text(commit.committedDate.toHumanReadableDate() ?? "")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.vertical, 4)
                            .padding(.horizontal)
                            .frame(maxWidth:.infinity, alignment: .leading)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .onAppear(){
            print(repo)
        }
    }
}

#Preview {
    RepoDetailView(repo: Repository(name: "Nada", description: "Anim ut consectetur ex culpa cupidatat esse dolore ipsum proident labore non. Esse magna officia dolor ea cillum cupidatat do anim. Qui deserunt laborum id sint sit officia aute cupidatat. Velit eiusmod eu occaecat duis proident veniam voluptate duis labore esse. Consequat minim anim minim.", stargazerCount: 0, owner: GitHub.Repository.Owner(login: "Elliot727", avatarUrl: Optional("https://avatars.githubusercontent.com/u/39097740?u=9e22e37a8d135ae73a512cd22bd47118c5ebb88e&v=4"), url: Optional("https://github.com/Elliot727")), forkCount: 0, createdAt: "2025-02-24T20:24:25Z", updatedAt: "2025-02-24T20:54:40Z", pushedAt: "2025-02-24T20:53:43Z", isFork: false, isArchived: false, isEmpty: Optional(false), isPrivate: Optional(true), isTemplate: Optional(false), isDisabled: Optional(false), licenseInfo: nil, url: "https://github.com/Elliot727/Nada", homepageUrl: Optional("https://nada-sepia.vercel.app"), defaultBranchRef: GitHub.Repository.Branch(name: "main", target: Optional(GitHub.Repository.BranchTarget(history: Optional(GitHub.Repository.CommitHistory(nodes: [GitHub.Repository.Commit(committedDate: "2025-02-24T20:53:35Z", message: "First Commit")]))))), languages: GitHub.Repository.LanguageConnection(nodes: [GitHub.Repository.Language(name: "JavaScript", color: Optional("#f1e05a")), GitHub.Repository.Language(name: "TypeScript", color: Optional("#3178c6")), GitHub.Repository.Language(name: "CSS", color: Optional("#663399"))], totalCount: Optional(3), totalSize: Optional(15043)), primaryLanguage: Optional(GitHub.Repository.Language(name: "TypeScript", color: Optional("#3178c6"))), watchers: Optional(GitHub.Repository.CountConnection(totalCount: 1)), issues: Optional(GitHub.Repository.CountConnection(totalCount: 0)), pullRequests: Optional(GitHub.Repository.CountConnection(totalCount: 0)), releases: Optional(GitHub.Repository.CountConnection(totalCount: 0)), diskUsage: Optional(4374), hasWikiEnabled: Optional(true), hasDiscussionsEnabled: Optional(false), codeOfConduct: nil, openGraphImageUrl: Optional("https://avatars.githubusercontent.com/u/39097740?s=400&v=4"), isInOrganization: Optional(false), mentionableUsers: Optional(GitHub.Repository.UserConnection(totalCount: 1, nodes: Optional([GitHub.Repository.User(login: "Elliot727", avatarUrl: Optional("https://avatars.githubusercontent.com/u/39097740?u=9e22e37a8d135ae73a512cd22bd47118c5ebb88e&v=4"))]))), collaborators: Optional(GitHub.Repository.UserConnection(totalCount: 1, nodes: Optional([GitHub.Repository.User(login: "Elliot727", avatarUrl: Optional("https://avatars.githubusercontent.com/u/39097740?u=9e22e37a8d135ae73a512cd22bd47118c5ebb88e&v=4"))]))), vulnerabilityAlerts: Optional(GitHub.Repository.CountConnection(totalCount: 0)), packages: Optional(GitHub.Repository.CountConnection(totalCount: 0)), mirrorUrl: nil, projectsUrl: Optional("https://github.com/Elliot727/Nada/projects")))
}
