//
//  SwiftUITabView.swift
//  ColourGame
//
//  Created by Kaushik on 03/01/24.
//

import SwiftUI

struct themeColour: ComfirmColor {
    var buttonColor: Color = .yellow
    var tabColor: UIColor = .blue
    var unselectedColor: UIColor = .black
    var selectedColor: Color = .white
}

struct AnotherThemeColour: ComfirmColor {
    var buttonColor: Color = .red
    var tabColor: UIColor = .orange
    var unselectedColor: UIColor = .green
    var selectedColor: Color = .mint
}

protocol ComfirmColor {
    var buttonColor: Color  { get }
    var tabColor: UIColor  { get }
    var unselectedColor: UIColor  { get }
    var selectedColor: Color  { get }
}

struct SwiftUITabView: View {
    var themeColor: ComfirmColor = AnotherThemeColour()
    @State var selectionColor = 1
    
    init() {
        UITabBar.appearance().backgroundColor = themeColor.tabColor
        UITabBar.appearance().unselectedItemTintColor = themeColor.unselectedColor
    }
    
    var body: some View {
        TabView(selection: $selectionColor) {
            HomeView(selectionColor: $selectionColor)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home").textCase(.uppercase)
                }.tag(1)
            ProfileView(selectionColor: $selectionColor)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile").textCase(.uppercase)
                }.tag(2)
            BrowseView(selectionColor: $selectionColor)
                .tabItem {
                    Image(systemName: "globe")
                    Text("globe").textCase(.uppercase)
                }.tag(3)
                
        }.accentColor(themeColor.selectedColor)
    }
}

#Preview {
    SwiftUITabView()
}


struct HomeView: View {
    @Binding var selectionColor: Int
    var themeColor = themeColour()
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack {
                Button(action: {
                    selectionColor = 2
                }, label: {
                    Text("Go Profile")
                        .padding()
                        .background(themeColor.buttonColor)
                        .cornerRadius(5)
                })
            }
        }
        
    }
}

struct ProfileView: View {
    @Binding var selectionColor: Int
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack {
                Button(action: {
                    selectionColor = 3
                }, label: {
                    Text("Go Browse")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                })
            }
        }
       
    }
}

struct BrowseView: View {
    @Binding var selectionColor: Int
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                Button(action: {
                    selectionColor = 1
                }, label: {
                    Text("Go Home")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                })
            }
        }
      
    }
}
