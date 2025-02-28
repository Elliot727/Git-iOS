import SwiftUI

struct LanguageCard: View {
    var language:Repository.Language
    var body: some View {
        HStack(spacing: 4) {
            Circle()
                .fill(language.name.colorForLanguage())
                .frame(width: 8, height: 8)
            Text(language.name)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.secondary.opacity(0.2), lineWidth: 1)
        )
    }
}
