import Kingfisher
import SwiftUI

struct ProfileImage: View {
    var imageURL:String
    var body: some View {
        KFImage(URL(string: imageURL))
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(.yellow,lineWidth: 2)
            }
    }
}
