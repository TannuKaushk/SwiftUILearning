//
//  SwiftSafeArea.swift
//  ColourGame
//
//  Created by TORVIS on 23/10/23.
//

import SwiftUI

struct SwiftSafeArea: View {
    var body: some View {
            VStack(alignment: .leading) {
                Text("Home")
                    .font(.largeTitle)
                ScrollView {
                    ForEach(0..<10) { index in
                      Rectangle()
                            .frame(width: .infinity, height: 150)
                            .foregroundColor(Color.blue)
                    }
                }
            }.background(
                Color.orange
                    .ignoresSafeArea(.all)
            )
        }
    }


struct SwiftSafeArea_Previews: PreviewProvider {
    static var previews: some View {
        SwiftSafeArea()
    }
}
