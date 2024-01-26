//
//  SwiftUIDatePicker.swift
//  ColourGame
//
//  Created by Kaushik on 26/12/23.
//

import SwiftUI

struct SwiftUIDatePicker: View {
    
    @State var showDatePicker: Bool = false
    @State var savedDate: Date? = nil
    var formatter: DateFormatter  {
        let formattre = DateFormatter()
        formattre.dateStyle = .medium
        return formattre
    }
    
    var body: some View {
        ZStack {
            HStack {
                Text("Selected date: ")
                Button(action: {
                    showDatePicker.toggle()
                }, label: {
                    Text(formatter.string(from: savedDate ?? Date()) ?? "SELECT DATE")
                })
            }
            

            if showDatePicker {
                DatePickerWithButtons(showDatePicker: $showDatePicker, savedDate: $savedDate, selectedDate: savedDate ?? Date())
                    .animation(.linear)
                    .transition(.opacity)
            }
        }
        
    }
}

struct DatePickerWithButtons: View {
    
    @Binding var showDatePicker: Bool
    @Binding var savedDate: Date?
    @State var selectedDate: Date = Date()
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                DatePicker("Test", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(WheelDatePickerStyle())
                
                Divider()
                HStack {
                    
                    Button(action: {
                        showDatePicker = false
                    }, label: {
                        Text("Cancel")
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        savedDate = selectedDate
                        showDatePicker = false
                    }, label: {
                        Text("Save".uppercased())
                            .bold()
                    })
                    
                }
                .padding(.horizontal)

            }
            .padding()
            .background(
                Color.white
                    .cornerRadius(30)
            )

            
        }

    }
}





#Preview {
    SwiftUIDatePicker()
}
