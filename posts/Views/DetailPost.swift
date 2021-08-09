//
//  DetailPost.swift
//  posts
//
//  Created by Andres Mendieta on 8/8/21.
//

import SwiftUI

struct DetailPost: View {
    @State var post: Post
    let userId: Int
    @State var user = User()
    @State var comments: [Comment] = []
    
    var body: some View {
        VStack(spacing: 10) {
            TitleText(text: "Description")
            BodyText(text: post.body)
            TitleText(text: "User")
            BodyText(text: "Name: \(user.name)")
            BodyText(text: "Email: \(user.email)")
            BodyText(text: "Phone: \(user.phone)")
            BodyText(text: "Website: \(user.website)")
            TitleText(text: "Comments")
            List(comments) { comment in
                Text(comment.body)
            }
            //Spacer()
        }
        .onAppear{
            let fetchUser = FetchUser(id: userId)
            fetchUser.getUser { user in
                self.user = user
            }
            let fetchComments = FetchComments(postId: post.id)
            fetchComments.getComments { comments in
                self.comments = comments
            }
        }
        .padding()
        .navigationTitle("Post")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing:
                Button(action: {
                    post.favorite = true
                }, label: {
                    Image(systemName: "star")
                })
        )
    }
}

struct TitleText: View {
    let text: String
    var body: some View {
        HStack {
            Text(text)
                .fontWeight(.bold)
                .font(.title2)
            Spacer()
        }
    }
}

struct BodyText: View {
    let text: String
    var body: some View {
        HStack {
            Text(text)
                .font(.body)
            Spacer()
        }
    }
}

extension UINavigationController {

  open override func viewWillLayoutSubviews() {
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }

}


struct DetailPost_Previews: PreviewProvider {
    static private var post1 = Post(userId: 1, id: 1, title: "Title Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum", body: "Body Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum", read: nil, favorite: nil)
    
    static var previews: some View {
        DetailPost(post: post1, userId: 1)
    }
}
