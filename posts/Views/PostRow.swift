//
//  PostRow.swift
//  posts
//
//  Created by Andres Mendieta on 8/8/21.
//

import SwiftUI

struct PostRow: View {
    @State var post: Post
    @State var isPresented = false
    
    var body: some View {
        NavigationLink(
            destination: DetailPost(post: post, userId: post.userId),
            isActive: $isPresented,
            label: {
                HStack {
                    getIcon()
                    Text(post.body)
                        .lineLimit(3)
                }
                .onTapGesture {
                    post.wasRead()
                    self.isPresented = true
                }
            })
    }
    
    private func getIcon() -> RowIcons {
//        print("getIcon: \(post)")
        if post.read == true && post.favorite == nil{
            return RowIcons(systemName: "circle.fill", color: .white)
        } else if post.read == nil && post.favorite == nil{
            return RowIcons(systemName: "circle.fill", color: .blue)
        } else {
            return RowIcons(systemName: "star.fill", color: .yellow)
        }
    }
}

struct PostRow_Previews: PreviewProvider {
    static private var post1 = Post(userId: 1, id: 1, title: "Title Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum", body: "Body Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum", read: nil, favorite: nil)
    static private var post2 = Post(userId: 1, id: 1, title: "Title Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum", body: "Body Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum", read: true, favorite: nil)
    static private var post3 = Post(userId: 1, id: 1, title: "Title Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum", body: "Body Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum", read: nil, favorite: true)
    
    static var previews: some View {
        VStack(spacing: 10) {
            PostRow(post: post1)
            PostRow(post: post2)
            PostRow(post: post3)
        }
    }
}
