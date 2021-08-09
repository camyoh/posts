//
//  Buttons.swift
//  posts
//
//  Created by Andres Mendieta on 8/9/21.
//

import SwiftUI

struct ButtonText: View {
    var text: String
    
    var body: some View{
        Text(text)
            .foregroundColor(.white)
            .font(.body)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red)
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        ButtonText(text: "Delete All")
    }
}
