//
//  AuthView.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import SwiftUI

/// User's authentication screen. Mostly contains basic authentication UI configurations
struct AuthView: View {

    // MARK: - ViewModel

    @StateObject private var viewModel = AuthViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
    //            Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 10, background: .pink)
                
    //            Login Form
                Form {
                    TextField("E-mail address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red )
                    }
//                    Log In button
                TLButton(title: "Log In", background: .pink) {
                    viewModel.logIn()
                }
            }
                .offset(y: -145)
    
                
    //            Create Account
                VStack {
                    Text("Don't have an account yet?")
                        .foregroundColor(.gray)
                
                    NavigationLink("Create", destination: RegisterView())
                    .foregroundColor(.pink)
                    .fontWeight(.bold)
                }
                .padding(.bottom, 10)
                
                Spacer()
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
