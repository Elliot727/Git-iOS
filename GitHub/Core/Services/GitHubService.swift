import Foundation

class GitHubService {
    private let session: URLSession
    private let token: String
    
    init(token: String, session: URLSession = .shared) {
        self.token = token
        self.session = session
    }
    
 
    func fetchRepositories() async throws -> [Repository] {
        let query = """
            query {
              viewer {
                repositories(first: 100) {
                  nodes {
                    name
                    description
                    stargazerCount
                    owner {
                      login
                      avatarUrl
                      url
                    }
                    forkCount
                    createdAt
                    updatedAt
                    pushedAt
                    languages(first: 10) {
                      nodes {
                        name
                        color
                      }
                      totalCount
                      totalSize
                    }
                    isFork
                    isArchived
                    isEmpty
                    isPrivate
                    isTemplate
                    isDisabled
                    licenseInfo {
                      name
                      spdxId
                      url
                    }
                    url
                    homepageUrl
                    defaultBranchRef {
                      name
                      target {
                        ... on Commit {
                          history(first: 100) {
                            nodes {
                              committedDate
                              message
                            }
                          }
                        }
                      }
                    }
                    primaryLanguage {
                      name
                      color
                    }
                    watchers {
                      totalCount
                    }
                    issues {
                      totalCount
                    }
                    pullRequests {
                      totalCount
                    }
                    releases {
                      totalCount
                    }
                    diskUsage
                    hasWikiEnabled
                    hasDiscussionsEnabled
                    codeOfConduct {
                      name
                      url
                    }
                    openGraphImageUrl
                    isInOrganization
                    mentionableUsers(first: 10) {
                      totalCount
                      nodes {
                        login
                        avatarUrl
                      }
                    }
                    collaborators(first: 10) {
                      totalCount
                      nodes {
                        login
                        avatarUrl
                      }
                    }
                    vulnerabilityAlerts(first: 5) {
                      totalCount
                    }
                    packages(first: 10) {
                      totalCount
                    }
                    mirrorUrl
                    projectsUrl
                  }
                  totalCount
                }
              }
            }
        """
        
        let urlBuilder = GitHubGraphQLURLBuilder()
            .withToken(token)
            .withQuery(query)
        
        let request: URLRequest
        do {
            request = try urlBuilder.asURLRequest()
        } catch {
            throw error
        }
        
        do {
            let (data, _) = try await session.data(for: request)
            let responseHandler = GraphQLResponseHandler<ViewerData>()
            let viewerData = try responseHandler.decode(data: data)
            return viewerData.viewer.repositories.nodes
        } catch {
            print(error)
            throw error
        }
    }


    func fetchUserProfile(username: String) async throws -> UserProfile {
        let query = """
        query {
          user(login: "\(username)") {
            login
            name
            bio
            avatarUrl
            location
            company
            websiteUrl
            twitterUsername
            followers {
              totalCount
            }
            following {
              totalCount
            }
          }
        }
        """
        
        let urlBuilder = GitHubGraphQLURLBuilder()
            .withToken(token)
            .withQuery(query)
        
        let request: URLRequest
        do {
            request = try urlBuilder.asURLRequest()
        } catch {
            throw error
        }
        
        do {
            let (data, _) = try await session.data(for: request)
            let responseHandler = GraphQLResponseHandler<UserProfileData>()
            let profileData = try responseHandler.decode(data: data)
            return profileData.user
        } catch {
            print(error)
            throw error
        }
    }
}
