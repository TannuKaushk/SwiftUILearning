//
//  SwiftUIPickerView.swift
//  ColourGame
//
//  Created by Kaushik on 26/12/23.
//

import SwiftUI

struct SwiftUIPickerView: View {
    @State var selection: String = "first"
    @State var pickerArray:[String] = ["first", "middle", "last"]
    var body: some View {
        VStack {
            Picker(selection: $selection) {
                ForEach(pickerArray.indices) { index in
                    Text("\(pickerArray[index])").tag("\(index)")
                }
            } label: {
                Text("Picker: wqrwe")
                    .foregroundColor(Color.red)
                    .background(Color.red)
            }.pickerStyle(.segmented).background(Color.red)


        }
    }
}

#Preview {
    SwiftUIPickerView()
}
