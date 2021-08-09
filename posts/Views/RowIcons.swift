//
//  RowIcons.swift
//  posts
//
//  Created by Andres Mendieta on 8/8/21.
//

import SwiftUI

struct RowIcons: View {
    var systemName: String
    var color: Color
    
    var body: some View {
        Image(systemName: systemName)
            .font(.body)
            .foregroundColor(color)
            .frame(width: 50, height: 50, alignment: .center)
    }
}

struct RowIcons_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            RowIcons(systemName: "circle.fill", color: .blue)
            RowIcons(systemName: "star.fill", color: .yellow)
        }
    }
}
