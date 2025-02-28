import SwiftUI

struct LanguagesRow: View {
    var languages:[Repository.Language]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(languages, id: \.name) { language in
                    LanguageCard(language: language)
                }
            }
            .padding(.vertical, 2)
            .padding(.horizontal)
        }
    }
}
