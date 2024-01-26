//
//  SwiftUIStateButtonChange.swift
//  ColourGame
//
//  Created by Kaushik on 11/12/23.
//

import SwiftUI

struct SwiftUIStateButtonChange: View {
    @State var backgroundColor: Color = .red
    @State var count: Int = 1
    var body: some View {
        ZStack {
            //background
            backgroundColor.ignoresSafeArea(edges: .all)
            //Content
            content
        }
        
    }
    
    
    var content: some View {
        VStack(spacing: 10) {
            Text("Title")
                .font(.title)
                Text("Count: 1")
                .underline()
                .font(.title)
         
            ButtonViewStruc(backgroundColor: $backgroundColor)
            
        }.foregroundColor(.white)
    }
                }


struct ButtonViewStruc: View {
    @Binding var backgroundColor: Color
    var body: some View {
        HStack(spacing: 20) {
            Button("Button 1") {
                backgroundColor = .orange
            }
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            Button("Button 2") {
               backgroundColor = .purple
            }
            .padding()
            .background(Color.purple)
            .cornerRadius(10)
        }.font(.headline)
    }
}
                

#Preview {
    SwiftUIStateButtonChange()
}
