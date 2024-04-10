//
//  ProfileView.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ProfileView: View {
    
    // MARK: - View Model

    @StateObject private var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    
    // MARK: - View Builder
    
    @ViewBuilder
    
    func profile(user: User) -> some View {
        //                Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.gray)
            .frame(width: 125, height: 125)
            .padding()
                        
        //                Info: name, email, member since
        VStack(alignment: .leading) {
            HStack {
                Text("Name:")
                    .bold()
                
                Text(user.name)
                
            }
            .padding()
                            
            HStack {
                Text("E-mail:")
                    .bold()
                
                Text(user.email)
                
            }
            .padding()

            HStack {
                Text("Member since:")
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                
            }
            .padding()
            
        }
        .padding()
                        
        //                Log Out button
        Button("Log Out") {
            viewModel.logOut()
            
        }
        .tint(.pink)
        .padding()
                        
        Spacer()
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
