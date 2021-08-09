//
//  Fetch.swift
//  posts
//
//  Created by Andres Mendieta on 8/8/21.
//

import SwiftUI

class FetchPosts: ObservableObject {
    
    static func getPosts(completion:@escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }

}

class FetchUser: ObservableObject {
    @Published var user = User()
    let id: Int
    
    init(id: Int){
        self.id = id
    }
    
    func getUser(completion:@escaping (User) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(id)") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let user = try! JSONDecoder().decode(User.self, from: data!)
            DispatchQueue.main.async {
                completion(user)
            }
        }
        .resume()
    }
}

class FetchComments: ObservableObject {
    @Published var comment: [Comment] = []
    let postId: Int
    
    init(postId: Int){
        self.postId = postId
    }
    
    func getComments(completion:@escaping ([Comment]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(postId)") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let comments = try! JSONDecoder().decode([Comment].self, from: data!)
            DispatchQueue.main.async {
                completion(comments)
            }
        }
        .resume()
    }
}
