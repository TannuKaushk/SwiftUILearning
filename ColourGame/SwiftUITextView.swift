//
//  TextView.swift
//  ColourGame
//
//  Created by TORVIS on 16/10/23.
//

import SwiftUI

struct SwiftUITextView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Alert!")
                    .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 10)
                Text("No Image found! \nLearn step my step, I will do it.!!!!!!! Learn more grow more...Lige is beautiful")
                    .font(.body)
                .fontWeight(.semibold)
                .padding(.bottom, 10)
                .multilineTextAlignment(.leading)
                .frame(width: UIScreen.main.bounds.width - 80, height: 100)
               // .padding(.horizontal, -60)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
        .padding(.bottom, 20)
        Image(systemName: "heart")
            .resizable()
            .frame(width: 200, height: 200)
                .background(Color.red)
        Text("Show Image")
            Spacer()
        }
        
    }
    
}

struct SwiftUITextView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextView()
            .preferredColorScheme(.light)

    }
}
