//
//  ContentView.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - View Model

    @StateObject private var viewModel = MainViewViewModel()
    
    
        var body: some View {
//            Get current user ID and show Profile View if user signed in
            if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
    //                    Signed in
                accountView
            } else {
//                Else show Auth View
                AuthView()
            }
    }
    
    // MARK: - View Builder

    @ViewBuilder
    var accountView: some View {
            TabView {
                ToDoListView(userID: viewModel.currentUserID)
                    .tabItem {
                    Label("Home", systemImage: "house")
                }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
