//
//  SwiftUIPagination.swift
//  ColourGame
//
//  Created by Kaushik on 03/01/24.
//

import SwiftUI

struct SwiftUIPagination: View {
    @State var imageArray = ["house.fill", "person.fill", "globe", "heart.fill"]
    var body: some View {
        tabView.tabViewStyle(.page)
            .background(Color.blue)
            .frame(width: UIScreen.main.bounds.width, height: 300)
    }
    
    private var tabView: some View {
        TabView {
            ForEach(imageArray, id: \.self) { image in
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .padding(40)
            }
        }
    }
}



#Preview {
    SwiftUIPagination()
}
