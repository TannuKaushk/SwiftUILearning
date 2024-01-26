//
//  SwiftUINavigationBar.swift
//  ColourGame
//
//  Created by Kaushik on 15/12/23.
//

import SwiftUI

struct SwiftUINavigationBar: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(leading:
                                    NavigationLink(destination: SwiftUIButton(), label: {
                Image(systemName: "arrow.left")
                    .accentColor(.black)
            }) ,
            trailing: Image(systemName: "heart.fill"))
          

        }
     
       
    }
}

#Preview {
    SwiftUINavigationBar()
}
