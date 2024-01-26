//
//  SwiftUITextFiled.swift
//  ColourGame
//
//  Created by Kaushik on 22/12/23.
//

import SwiftUI

struct SwiftUITextFiled: View {
    @State var userName: String = ""
    @State var lastName: String = ""
    @State var dob: String = ""
    @State var age: String = ""
    @State var count: Int = 0
    @State var isOn: Bool = false
    @State var status: String = ""
    @State var dataArray:[String] = [String]()
    var body: some View {
        VStack(spacing: 10) {
            Text("\(isOn ? "Online" : "Offline" )")
                .font(.headline)
                .fontWeight(.bold)
            HStack {
                Toggle(isOn: $isOn, label: {
                    
                    Text("Status")
                        .font(.headline)
                        .foregroundColor(Color.red)
                })
                .padding(.horizontal, 100.0)
            }
                TextFiledView(username: $userName, lastName: $lastName, dob: $dob, age: $age, countNum: $count)
            
            Button(action: {
                saveData()
            }, label: {
                Text("Save")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10.0)
                    .foregroundColor(Color.white)
            })
            ForEach(dataArray, id: \.self) { data in
                Text("\(data)")
            }
        }.padding()
          
      
        }
   
    func saveData() {
            dataArray.append(userName)
        userName = ""

    }
    }
    


#Preview {
    SwiftUITextFiled()
}

struct TextFiledView: View {
    @Binding var username: String
    @Binding var lastName: String
    @Binding var dob: String
    @Binding var age: String
    @Binding var countNum: Int
    @State var fieldArray: [String] = ["Enter Name","Enter LastName","Enter Age", "Enter Dob"]
    var body: some View {
            TextField(fieldArray[0], text: $username)
                .font(.headline)
                .padding()
                .foregroundColor(Color.green)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(3.0)
            TextField(fieldArray[1], text: $lastName)
                .font(.headline)
                .padding()
                .foregroundColor(Color.green)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(3.0)
            TextField(fieldArray[2], text: $dob)
                .font(.headline)
                .padding()
                .foregroundColor(Color.green)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(3.0)
            TextField(fieldArray[3], text: $age)
                .font(.headline)
                .padding()
                .foregroundColor(Color.green)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(3.0)
    }
           
        
       
    }
    

