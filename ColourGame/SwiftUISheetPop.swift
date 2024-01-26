//
//  SwiftUISheetPop.swift
//  ColourGame
//
//  Created by Kaushik on 13/12/23.
//

import SwiftUI

struct SwiftUISheetPop: View {
    @State var sheetView: Bool = false
    var body: some View {
        ZStack {
            Color.red
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                sheetView.toggle()
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10.0)
            })
            
//          .sheet(isPresented: $sheetView, content: {
//                SwiftUIState()
//                    
//            })
            if sheetView {
                SwiftUIState(sheetView: $sheetView)
                    //.padding(.top)
                .transition(.move(edge: .bottom))
                .animation(.spring)
                .zIndex(1.0)
            }
            
        }
    }
}

#Preview {
    SwiftUISheetPop()
}
