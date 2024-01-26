//
//  SwiftUITernaryOperator.swift
//  ColourGame
//
//  Created by Kaushik on 12/12/23.
//

import SwiftUI

struct SwiftUITernaryOperator: View {
    @State var isStartingSate: Bool = true
    var body: some View {
        VStack {
        Button("Press me: \(isStartingSate.description)") {
                isStartingSate.toggle()
               
            }
            
                RoundedRectangle(cornerRadius: 10.0)
                .fill(isStartingSate ? Color.red : Color.orange)
                .frame(width: isStartingSate ? 200 : 300, height: isStartingSate ? 200 : 400)
            
            Spacer()
        }
    }
}

#Preview {
    SwiftUITernaryOperator()
}
