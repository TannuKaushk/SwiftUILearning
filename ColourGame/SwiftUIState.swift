//
//  SwiftUIState.swift
//  ColourGame
//
//  Created by TORVIS on 23/10/23.
//

import SwiftUI

struct SwiftUIState: View {
    @State var background: Color = .green
    @State var title = "Press Button To Change Colour"
    @State var count: Int = 0
    @Environment(\.presentationMode) var presentationMode
    @Binding var sheetView: Bool
    var body: some View {
        ZStack() {
            background
                .ignoresSafeArea()
            VStack() {
                    HStack() {
                        Button(action: {
                         //   presentationMode.wrappedValue.dismiss()
                            sheetView.toggle()
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                    }
                        )
                        .padding(.leading)
                        Spacer()
                        
                    }
             Spacer()
                ButtonView(background: $background, title: $title, count: $count)
                Spacer()
            }
           
           
            
           
        }
    }
}

//struct SwiftUIState_Previews: PreviewProvider {
//    static var previews: some View {
//       // SwiftUIState(, sheetView: $)
//    }
//}

struct ButtonView: View {
    @Binding var background: Color
    @Binding var title: String
    @Binding var count: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title).bold()
                .font(.title)
                .frame(width: .infinity)
                .multilineTextAlignment(.center)
            Text("\(count)").bold()
            ExtractedButtonView(background: $background, title: $title, count: $count)
            
            
        }
    }
}

struct ExtractedButtonView: View {
    @Binding var background: Color
    @Binding var title: String
    @Binding var count: Int
    var body: some View {
        HStack(spacing: 20) {
            Button("Button 1") {
                background = .orange
                title = "background Change to Orange Color"
                count += 1
            }
            .font(.largeTitle)
            .foregroundColor(Color.white)
            Button("Button 2") {
                background = .purple
                title = "background Change to Purple Color"
                count -= 1
            }
            .font(.largeTitle)
            .foregroundColor(Color.white)
        }
    }
}
