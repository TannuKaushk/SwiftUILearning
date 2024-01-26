//
//  SwiftUIViewScrollView.swift
//  ColourGame
//
//  Created by TORVIS on 21/10/23.
//

import SwiftUI

struct SwiftUIViewScrollView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(0..<20) { index in
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(0..<20) { index in
                            Rectangle()
                                 .frame(width: 200, height: 200)
                                 .cornerRadius(10)
                                 .foregroundColor(.red)
                            }
                        }
                    }
                    
                    
                   
                }
            }
        }
    }
}

struct SwiftUIViewScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewScrollView()
    }
}

