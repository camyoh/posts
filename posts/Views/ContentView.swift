//
//  ContentView.swift
//  posts
//
//  Created by Andres Mendieta on 8/8/21.
//

import SwiftUI

struct ContentView: View {
    let coloredNavAppearance = UINavigationBarAppearance()
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.accentColor)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.accentColor)], for: .normal)
    }
    
    @State private var selectedPost: ShowOptions = .all
    @State var posts: [Post] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("options", selection: $selectedPost) {
                    ForEach(ShowOptions.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }.padding()
                .pickerStyle(SegmentedPickerStyle())
                List(){
                    ForEach(posts) { post in
                        PostRow(post: post)
                    }
                }.listStyle(PlainListStyle())
                Button(action: {
                    self.posts = []
                }, label: {
                    ButtonText(text: "Delete All")
                })
                .navigationBarTitle("Posts")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            self.posts = []
                            FetchPosts.getPosts { (posts) in
                                self.posts = posts
                            }
                        }, label: {
                            Image(systemName: "arrow.clockwise")
                        })
                
                )
            }.onAppear {
                FetchPosts.getPosts { (posts) in
                    self.posts = posts
                }
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


