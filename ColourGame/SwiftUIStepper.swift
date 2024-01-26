//
//  SwiftUIStepper.swift
//  ColourGame
//
//  Created by Kaushik on 26/12/23.
//

import SwiftUI

struct SwiftUIStepper: View {
    @State var incrementHeight: CGFloat = 10
    @State var incrementWidht: CGFloat = 10
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 200 + incrementWidht, height: 200 + incrementHeight)
                .cornerRadius(10.0)
              .foregroundColor(Color.red)
              .padding()
            HStack {
                Stepper("Lets Go!!", onIncrement: {
                    setIncremant(amount: 10)
                }, onDecrement: {
                    setIncremant(amount: -10)
            })
                .padding()
            }
        }
     
    }
    func setIncremant(amount: CGFloat) {
        withAnimation(.bouncy) {
            incrementWidht += amount
            incrementHeight += amount
        }
    }
}

#Preview {
    SwiftUIStepper()
}
