import SwiftUI

extension String {
    func toHumanReadableDate() -> String? {
        let isoFormatter = ISO8601DateFormatter()
        guard let date = isoFormatter.date(from: self) else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"  
        return formatter.string(from: date)
    }
    
    func colorForLanguage() -> Color {
        switch self.lowercased() {
          case "swift": return .orange
          case "go": return .blue
          case "javascript": return .yellow
          case "typescript": return .blue
          case "python": return .green
          case "ruby": return .red
          case "html": return .purple
          case "css": return .teal
          case "c++", "cpp": return .pink
          case "c#", "csharp": return .indigo
          case "java": return .brown
          case "php": return .cyan
          case "makefile": return .gray
          case "rust": return .orange.opacity(0.8)
          case "kotlin": return .purple.opacity(0.7)
          case "dart": return .teal.opacity(0.8)
          case "scala": return .red.opacity(0.8)
          case "elixir": return .purple.opacity(0.9)
          case "perl": return .blue.opacity(0.6)
          case "haskell": return .purple.opacity(0.5)
          case "clojure": return .green.opacity(0.7)
          case "r": return .blue.opacity(0.4)
          case "shell", "bash": return .green.opacity(0.5)
          case "objective-c": return .orange.opacity(0.6)
          case "vue": return .green.opacity(0.9)
          case "lua": return .blue.opacity(0.7)
          case "groovy": return .teal.opacity(0.6)
          case "assembly", "asm": return .gray.opacity(0.8)
          case "coffeescript": return .brown.opacity(0.8)
          case "dockerfile": return .blue.opacity(0.5)
          case "julia": return .pink.opacity(0.7)
          case "matlab": return .orange.opacity(0.5)
          case "powershell": return .blue.opacity(0.8)
          case "sql": return .indigo.opacity(0.6)
          case "yaml": return .indigo.opacity(0.8)
          case "json": return .orange.opacity(0.7)
          case "xml": return .purple.opacity(0.6)
          case "markdown", "md": return .blue.opacity(0.3)
          case "graphql": return .pink.opacity(0.8)
          case "terraform": return .purple.opacity(0.8)
          case "solidity": return .gray.opacity(0.7)
          case "pascal": return .blue.opacity(0.9)
          case "erlang": return .red.opacity(0.6)
          case "f#": return .indigo.opacity(0.7)
          case "fortran": return .purple.opacity(0.4)
          case "ocaml": return .orange.opacity(0.9)
          default: return .secondary
          }
      }
}
