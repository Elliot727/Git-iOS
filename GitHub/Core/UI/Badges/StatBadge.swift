import SwiftUI

struct StatBadge: View {
    var icon: String
    var count: Int
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 12))
            Text("\(count)")
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .foregroundStyle(.secondary)
    }
}
