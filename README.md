# Git-iOS

Git-iOS is a sleek iOS app that leverages GitHub's GraphQL API to provide fast and efficient repository insights. Built with Swift and SwiftUI, it offers real-time updates, optimised queries, and a smooth user experience for developers.

## Features
- Real-time repository insights with GitHub’s GraphQL API.
- Optimised queries for minimal data fetching and maximum speed.

## Setup

### 1. Get a GitHub Personal Access Token (PAT)
To use Git-iOS, you need a GitHub Personal Access Token (PAT):

1. Go to [GitHub Developer Settings](https://github.com/settings/personal-access-tokens).
2. Click **Generate new token**.
3. Select the necessary scopes:
   - `repo` (for accessing private repositories, if needed)
   - `read:user` (for fetching user data)
4. Copy the generated token.

### 2. Add the PAT to the App
Store your PAT securely in your Xcode project:

1. Open `GitHubApp.swift` and replace `"PAT"` with your actual token:
   ```swift
   var githubService = GitHubService(token: "YOUR_PERSONAL_ACCESS_TOKEN")
   ```
## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/Elliot727/Git-iOS.git
   ```
2. Open `Git-iOS.xcodeproj` in Xcode.
3. Build and run the app.

## Technologies Used
- **Swift & SwiftUI** – Modern UI framework for iOS.
- **GraphQL** – Efficient API queries.
- **Async/Await** – Smooth async operations.

## Contributing
Contributions are welcome! Feel free to submit issues or open a pull request.

## License
This project is licensed under the MIT License.

Built with ❤️ by [Elliot727](https://github.com/Elliot727).

