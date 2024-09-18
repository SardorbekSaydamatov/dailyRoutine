//
//  ContentView.swift
//  PieChart
//
//  Created by Sardorbek Saydamatov on 10/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu: Bool = false
    @State private var selectedTab = 0
    @State private var navigationTitle: Array = ["One-day routine", "Edit task", "Profile"]
    var body: some View {
            ZStack {
                Group {
                    switch selectedTab {
                    case 0:
                        MainView()
                    case 1:
                        EditTaskView()
                    case 2:
                        ProfileView()
                    default:
                        EmptyView()
                    }
                }
                
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            }
            .navigationBarBackButtonHidden()
            .navigationTitle(navigationTitle[selectedTab])
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                    .foregroundStyle(Color.gray)
                }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
