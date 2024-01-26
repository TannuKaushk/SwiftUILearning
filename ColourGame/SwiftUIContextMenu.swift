//
//  SwiftUIContextMenu.swift
//  ColourGame
//
//  Created by Kaushik on 22/12/23.
//

import SwiftUI

struct SwiftUIContextMenu: View {
    @State var backgroundColor = Color.gray
    @State var textColor = Color.black
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("SwiftUI Thinking")
                .font(.headline)
            Text("Learning SwiftUI")
                .font(.subheadline)
        }
        .padding()
        .foregroundColor(textColor)
        .background(backgroundColor)
        .cornerRadius(5.0)
        .contextMenu(ContextMenu(menuItems: {
            Button(action: {
                backgroundColor = Color.yellow
            }, label: {
                Text("Share")
            })
            Button(action: {
                backgroundColor = Color.red
            }, label: {
                Text("Like")
                    .accentColor(Color.red)
                Image(systemName: "heart.fill")
                
            })
            Button(action: {
                backgroundColor = Color.blue
                textColor = Color.white
            }, label: {
                Text("Report")
            })
        }))
    }
}

#Preview {
    SwiftUIContextMenu()
}
