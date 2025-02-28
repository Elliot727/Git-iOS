import Foundation

extension Int {
    func formattedSize() -> String {
        let sizes = ["KB", "MB", "GB", "TB"]
        var size = Double(self)
        var index = 0
        
        while size >= 1024, index < sizes.count - 1 {
            size /= 1024
            index += 1
        }
        
        return String(format: "%.2f %@", size, sizes[index])
    }
}
