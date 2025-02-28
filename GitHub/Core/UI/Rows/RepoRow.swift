import SwiftUI

struct RepoRow: View {
    var repo: Repository
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                Image(systemName: iconForRepo)
                    .font(.system(size: 18))
                    .foregroundStyle(colorForRepo)
                Text(repo.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .lineLimit(1)
                    .truncationMode(.tail)
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundStyle(.yellow)
                    Text("\(repo.stargazerCount)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal)
            if let description = repo.description, !description.isEmpty {
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .padding(.horizontal)
            }
            
            if !repo.languages.nodes.isEmpty {
                LanguagesRow(languages: repo.languages.nodes)
            }
            
            HStack {
                Label {
                    Text(repo.createdAt.toHumanReadableDate() ?? "")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                } icon: {
                    Image(systemName: "calendar")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                if repo.forkCount > 0 {
                    Label {
                        Text("\(repo.forkCount)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    } icon: {
                        Image(systemName: "tuningfork")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Label {
                    Text(repo.defaultBranchRef.name)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                } icon: {
                    Image(systemName: "arrow.triangle.branch")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 12)
        .background(.white)
    }
    
    private var iconForRepo: String {
        if repo.isFork {
            return "arrow.triangle.branch"
        } else if repo.isArchived {
            return "archivebox.fill"
        } else {
            return "folder.fill"
        }
    }
    
    private var colorForRepo: Color {
        if repo.isFork {
            return .orange
        } else if repo.isArchived {
            return .gray
        } else {
            return .blue
        }
    }
}

