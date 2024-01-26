//
//  SwiftUIProgress.swift
//  ColourGame
//
//  Created by TORVIS on 25/10/23.
//

import SwiftUI

struct SwiftUIProgress: View {
    @State var isAnimated = false
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack {
                Button {
                    isAnimated.toggle()
                 
                } label: {
                    Text(
                        isAnimated ? "Red Button" : "Blue Button"
                    )
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            isAnimated ? Color.red : Color.red
                        )
                        .cornerRadius(10)
                    
                }
                Spacer()
                Rectangle()
                    .fill(isAnimated ? Color.red : Color.red)
                    .frame(
                        width: isAnimated ?  300 : 100,
                        height: 100)
                    .cornerRadius(50)
                    .animation(.spring(response: 0.5, dampingFraction: 0.2, blendDuration: 1.0).repeatForever(autoreverses: true))
                Spacer()
            }
        }
    }
}

struct SwiftUIProgress_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIProgress()
    }
}
