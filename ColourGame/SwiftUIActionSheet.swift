//
//  SwiftUI.swift
//  ColourGame
//
//  Created by Kaushik on 21/12/23.
//

import SwiftUI

struct SwiftUIActionSheet: View {
    @State var showActionSheet: Bool = false
    @State var openAction: open_Action = .ismyPost
    
    enum open_Action {
        case ismyPost
        case isOtherPost
    }
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                   Circle()
                        .frame(width: 50, height: 50)
                    Text("@Username")
                    Spacer()
                    Button(action: {
                        showActionSheet.toggle()
                        openAction = .ismyPost
                    }, label: {
                        Image(systemName: "ellipsis")
                    })
                }.accentColor(.primary)
                .padding(.horizontal)
                Rectangle()
                    .aspectRatio(1.0, contentMode: .fit)
                
            }
          
            
            .actionSheet(isPresented: $showActionSheet, content: {
                openActionSheet()
                
        })
            .navigationTitle("ActionSheet")
        }
    }
    
    func openActionSheet() -> ActionSheet {
        let share : ActionSheet.Button = .default(Text("Share")) {
      // add code here
        }
        let report : ActionSheet.Button = .destructive(Text("Report")) {
            //add some code here
        }
        let delete : ActionSheet.Button = .destructive(Text("Delete")) {
            //add some code here
        }
        let cancel : ActionSheet.Button = .cancel(Text("Cancel"))
        switch openAction  {
        case .ismyPost:
            return  ActionSheet(title: Text("ActionSheet"), message: Text("Please select one"), buttons: [share,report,delete, cancel])
        case .isOtherPost:
            return  ActionSheet(title: Text("ActionSheet"), message: Text("Please select one"), buttons: [share,report,cancel])
        }
       
    }
}

#Preview {
    SwiftUIActionSheet()
}
