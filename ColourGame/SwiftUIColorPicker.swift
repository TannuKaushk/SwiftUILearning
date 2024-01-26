//
//  SwiftUIColorPicker.swift
//  ColourGame
//
//  Created by Kaushik on 26/12/23.
//

import SwiftUI

struct SwiftUIColorPicker: View {
    @State var selectedColor: Color = .black
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    ColorPicker(selection: $selectedColor,
                        supportsOpacity: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, label: {
                        Text("Color Me Please!!")
                            .padding()
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .background(Color.yellow)
                            .cornerRadius(10.0)
                            .shadow(radius: 10)
                            .padding()
                    }).background(Color.orange)
                        .padding(10)
                        .background(Color.orange)
                }
                Spacer()
                HStack(spacing: 30) {
                    Circle()
                        .frame(width: 50, height: 50)
                       
                    Circle()
                        .frame(width: 50, height: 50)
                }
                Capsule()
                    .frame(width: 110, height: 108)
                Circle()
                    .frame(width: 200, height: 200)
                HStack(spacing: 50) {
                    Circle()
                        .frame(width: 75, height: 75)
                    Circle()
                        .frame(width: 75, height: 75)
                }
                
                Spacer()
            } .foregroundColor(selectedColor)
            
        }
    }
}

#Preview {
    SwiftUIColorPicker()
}
