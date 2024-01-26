//
//  SwiftUIButton.swift
//  ColourGame
//
//  Created by TORVIS on 23/10/23.
//

import SwiftUI

struct SwiftUIButton: View {
    @State var title: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
                .navigationTitle("Home")
                .navigationBarHidden(true)
            VStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "arrow.left")
                                .frame(width: 60, height: 40)
                                .accentColor(.black)
                    })
                        Spacer()
                    }
                    Spacer()
                    Text(title)
                    Button("Press Me") {
                        title = "Button #1 was pressed"
                    }
                    Button {
                        title = "Button #2 was pressed"
                    } label: {
                        Text("Save".uppercased())
                            .font(.title)
                            .bold()
                            .foregroundColor(Color.white)
                            .padding()
                    }
                    .background(
                        Color.blue
                    )
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 10)
                    
                    Button {
                        title = "Button #3 was pressed"
                    } label: {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 60, height: 60)
                            .shadow(radius: 10)
                            .overlay(
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.red)
                            )
                    }
                    
                    Button {
                        title = "Button #4 was pressed"
                    } label: {
                        Text("finish".uppercased())
                            .padding()
                            .padding(.horizontal, 10)
                            .foregroundColor(Color.black)
                            .background(
                                Capsule()
                                    .stroke(lineWidth: 2).fill(Color.black)
                            )
                    }
                    
                    Spacer()
                    
            }
        }
            
        
    }
}

struct SwiftUIButton_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIButton()
    }
}
