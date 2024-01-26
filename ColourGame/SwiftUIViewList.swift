//
//  SwiftUIViewList.swift
//  ColourGame
//
//  Created by Kaushik on 15/12/23.
//

import SwiftUI

struct SwiftUIViewList: View {
    @State var fruits: [String] = ["Apple", "Orange", "Banana", "Lichi", "Gwawa","Grapes"]
    @State var section: [String] = ["Fruits", "Vegitables"]
    @State var showToggle: Bool = false
    @State var errorTitle: String = ""
    @State var errorMessage: String = ""
    @State var alertType: AlertType? = nil
    @Environment(\.presentationMode) var presentationMode
    enum AlertType {
        case success
        case error
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(section, id: \.self) { items in
                    Section(header: 
                                HStack {
                        Text(items)
                       Image(systemName: "heart.fill")
                    }
                    
                    ) {
                        ForEach(fruits, id: \.self) { items in
                            Text("\(items)")
                            
                        }
                        .onDelete(perform: { indexSet in
                            delete(indexSet: indexSet)
                        })
                        
                        .onMove(perform: { indices, newOffset in
                            moveOn(indices: indices, newOffset: newOffset)
                        })
                    }
                }
                
                
                .listStyle(SidebarListStyle())
            }
            
            .navigationTitle("Fruits List")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                alertType = .success
                showToggle.toggle()
            }, label: {
                Text("ADD")
                    .fontWeight(.bold)
                    
            })
                                    .alert(isPresented: $showToggle, content: {
                                        showAlert()
                                    })
            )
        }
       
       
        }
    
    //Alert Body
    func showAlert() -> Alert {
        switch alertType {
        case .success:
           return Alert(title: Text(errorTitle), message: Text(errorMessage), primaryButton: .destructive(Text("Delete"),action: {
                
            }), secondaryButton: .cancel())
            break
        case .error:
           return Alert(title: Text(errorTitle), message: Text(errorMessage), primaryButton: .destructive(Text("Delete"),action: {
                
            }), secondaryButton: .cancel())
            break
        default:
        return Alert(title: Text(errorTitle), message: Text(errorMessage), primaryButton: .destructive(Text("Delete"),action: {
                 
             }), secondaryButton: .cancel())
        }
//        Alert(title: Text(errorTitle), message: Text(errorMessage), primaryButton: .destructive(Text("Delete"),action: {
//        
//        }), secondaryButton: .cancel())
    }
    
    //AddButton
    func addButton() {
        
    }
    
    //OnMove
    func moveOn(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    //On delete
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
}

#Preview {
    SwiftUIViewList()
}
