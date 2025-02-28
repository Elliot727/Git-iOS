import SwiftUI

struct ActivityBadge: View {
    var icon: String
    var text: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 12))
            Text(text)
                .font(.caption)
        }
        .foregroundStyle(color)
    }
}
