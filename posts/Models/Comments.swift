//
//  Comments.swift
//  posts
//
//  Created by Andres Mendieta on 8/9/21.
//

struct Comment: Codable, Identifiable {
    public var postId: Int = 1
    public var id: Int = 1
    public var name: String = ""
    public var email: String = ""
    public var body: String = ""
}

