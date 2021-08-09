//
//  Todo.swift
//  posts
//
//  Created by Andres Mendieta on 8/8/21.
//

class Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    var read: Bool?
    var favorite: Bool?
    
    init(userId: Int = 0, id: Int = 0, title: String = "", body: String = "", read: Bool? = nil, favorite: Bool? = nil) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
        self.read = read
        self.favorite = favorite
    }
    
    func wasRead() {
        read = true
    }
    
    func markAsFavorite() {
        favorite = true
    }
    
}

