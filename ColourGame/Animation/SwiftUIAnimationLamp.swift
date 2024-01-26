//
//  SwiftUIAnimationLamp.swift
//  ColourGame
//
//  Created by Kaushik on 26/01/24.
//

import Foundation
import SwiftUI

struct Lamp: View {
    
    let text = "Please tap on bulb and see magic"
    
    static let initialOffset: CGSize = .init(width: 0, height: 70)
    @State private var lampOffset: CGSize = initialOffset
    @State private var lampColor: Color = Color.yellow
    
    @State private var lampOn: Bool = false
    
    var body: some View {
        ZStack {
            textView
            ScrollView {
                VStack (alignment: .leading) {
                Image("GirlImg")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .aspectRatio(contentMode: .fill)
                        .opacity(lampOn ? 1 : 0)
                }.overlay(content: {
                    ColorPicker("", selection: $lampColor)
                        .vTop()
                        .hTrailing()
                        .padding(20.0)
                        .opacity(lampOn ? 0 : 1)
                        .zIndex(2)
                })
                .padding(.horizontal)
            }.zIndex(1).ignoresSafeArea()
            

            
            ZStack(alignment: .top) {

                Rope(lampOffset: lampOffset)
                    .stroke(Color(.lightGray),
                            lineWidth: 4)
                
                Rectangle()
                    .fill(lampOn ? lampColor : .clear)
                    .frame(width: 150, height: 150)
                    .offset(x: lampOffset.width, y: lampOffset.height)
                    .blur(radius: 90)
                
                Image(systemName: "lightbulb.fill")
                    .resizable()
                    .frame(width: 30, height: 50)
                    .foregroundColor(lampOn ? lampColor : Color(.lightGray) )
                    .rotationEffect(.degrees(180))
                    .offset(x: lampOffset.width, y: lampOffset.height)
                    .overlay {
                        Circle()
                            .fill(.black)
                            .frame(width: 13, height: 13)
                            .offset(x: lampOffset.width, y: lampOffset.height)
                            .blur(radius: 8)
                            .opacity(lampOn ? 0 : 1)
                    }
                    .gesture(
                        DragGesture().onChanged { value in
                            lampOffset = .init(width: value.translation.width, height: value.translation.height + 70)
                        } .onEnded({ value in
                            lampOffset = Lamp
                            .initialOffset
                        })
                    )
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.6)) {
                            lampOn.toggle()
                        }
                    }
            }
            .animation(.spring(response: 0.35,
                               dampingFraction: 0.35,
                               blendDuration: 0),
                       value: lampOffset == Lamp.initialOffset )
            .edgesIgnoringSafeArea(.top)
            .zIndex(3)
        }
    }
    
    var textView: some View {
        Text("\(text)")
            .font(.headline)
            .foregroundColor(.red)
            .fontWeight(.bold)
    }
}

struct Rope: Shape {
    
    var lampOffset: CGSize
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: 0))
            path.addLine(to: .init(x: lampOffset.width + rect.midX, y: lampOffset.height))
        }
    }

    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(lampOffset.width, lampOffset.height) }
        set {
            lampOffset.width = newValue.first
            lampOffset.height = newValue.second
        }
    }
}

fileprivate extension View {
    
    // MARK: Vertical Center
    func vCenter() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .center)
    }
    
    // MARK: Vertical Top
    func vTop() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
    // MARK: Vertical Bottom
    func vBottom() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    // MARK: Horizontal Center
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    // MARK: Horizontal Leading
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: Horizontal Trailing
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct Lamp_Previews: PreviewProvider {
    static var previews: some View {
        Lamp()
            .preferredColorScheme(.dark)
    }
}
