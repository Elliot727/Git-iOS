import SwiftUI

struct CollaboratorsRow: View {
    var users:[Repository.User]
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(users, id:\.self){user in
                    VStack(alignment: .leading) {
                        ProfileImage(imageURL: user.avatarUrl ?? "")
                        Text(user.login)
                            .font(.subheadline)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 2)
        }
    }
}

