//
//  ContentView.swift
//  ColourGame
//
//  Created by TORVIS on 11/10/23.
//

import SwiftUI
enum Fruit {
    case apple
    case Orange
}
struct SwiftUIShapesAndColor: View {
    var backgroundColor: Color
    var count: Int
    var fruit: String
    
    init(fruit: Fruit) {
        if fruit == .apple {
            self.fruit = "Apple"
            self.backgroundColor = .red
            self.count = 10
        } else {
            self.fruit = "Orange"
            self.backgroundColor = .orange
            self.count = 30
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(0..<10) { index in
                    VStack {
                        Text("\(count)")
                            .font(.largeTitle)
                        .underline()
                        Text(fruit)
                            .font(.title)
                    }
                    
                    .frame(width: 100, height: 100)
                    .background(backgroundColor)
                    .cornerRadius(20)
                    
                    HStack {
                        VStack {
                        Text("\(count)")
                            .font(.largeTitle)
                        .underline()
                        Text(fruit)
                            .font(.title)
                        }
                    .frame(width: 100, height: 100)
                    .background(backgroundColor)
                    .cornerRadius(20)
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.yellow)
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.green)
                    }
                }
                
               
            }
        }
       
       
    }
}

struct SwiftUIShapesAndColor_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIShapesAndColor(fruit: .apple)
    }
}
