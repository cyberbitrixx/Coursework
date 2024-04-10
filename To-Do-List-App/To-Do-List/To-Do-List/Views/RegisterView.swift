//
//  RegisterView.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import SwiftUI

/// User's registration. Mostly contains basic UI configurations and functionality for signing up a new user
struct RegisterView: View {
    
    // MARK: - View Model

    @StateObject private var viewModel = RegisterViewViewModel()
    
    
    var body: some View {
        VStack {
//            Header
            HeaderView(title: "Register", subtitle: "start organizing todo's", angle: -10, background: .orange)
                .offset(y: 30)
                Spacer()
            
//            Register
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("E-mail", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                
                TextField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                
                TLButton(title: "Create Account", background: .orange) {
//                        Attempt sign up
                    viewModel.register()
                }
            }
            .offset(y: -120)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
