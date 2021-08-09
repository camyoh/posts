# Posts App

<img src="https://github.com/camyoh/posts/blob/main/images/video.gif?raw=true" width="30%"></img> <img src="https://github.com/camyoh/posts/blob/main/images/posts.jpg?raw=true" width="30%"></img> <img src="https://github.com/camyoh/posts/blob/main/images/detailPost.jpg?raw=true" width="30%"></img> 

## Structure

The app has three folder Views, Models and App. In Model we can found structs or classes for the Post, User and Comments, we also can find the Fetch service and a Constant file.

### Post
```swift
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
```

### User
```swift
struct User: Codable {
    public var name: String = ""
    public var email: String = ""
    public var phone: String = ""
    public var website: String = ""
}
```

### Comments
```swift
struct Comment: Codable, Identifiable {
    public var postId: Int = 1
    public var id: Int = 1
    public var name: String = ""
    public var email: String = ""
    public var body: String = ""
}
```

### Fetch
```swift
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
```
