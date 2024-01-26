//
//  SwiftUIBasicAnimation.swift
//  ColourGame
//
//  Created by Kaushik on 12/12/23.
//

import SwiftUI

struct SwiftUIBasicAnimation: View {
    @State var isAnimated: Bool = true
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    isAnimated.toggle()
                }, label: {
                    Text("Swich")
                        .foregroundColor(.black)
                        .font(.title)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.yellow)
                        .cornerRadius(10.0)
                        
                })
                Spacer()
                if isAnimated {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color.green)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                    
                }
              
            }  .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    SwiftUIBasicAnimation()
}
