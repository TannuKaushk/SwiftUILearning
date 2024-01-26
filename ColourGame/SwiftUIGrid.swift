//
//  SwiftUIGrid.swift
//  ColourGame
//
//  Created by TORVIS on 21/10/23.
//

import SwiftUI

struct SwiftUIGrid: View {
    let coulumns: [GridItem] = [GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)]
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.orange)
                .frame(height: 300)
            LazyVGrid(columns: coulumns) {
                ForEach(0..<20) { index in
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 100)
                }
            }
                
        }
    }
}

struct SwiftUIGrid_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGrid()
    }
}
