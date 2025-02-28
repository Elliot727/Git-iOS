import SwiftUI

struct UserProfileView: View {
    var user:UserProfile
    var body: some View {
        VStack{
            HStack{
                ProfileImage(imageURL: user.avatarUrl)
                    .padding(.trailing, 4)
                VStack(alignment: .leading) {
                    Text(user.name ?? "Unkown")
                        .font(.headline)
                    Text("@" + user.login)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Button {
                    
                } label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Edit Profile")
                    }
                    .font(.footnote)
                    .foregroundStyle(.black)
                    .padding(8)
                    .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                }
            }
        }
    }
}

