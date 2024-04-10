//
//  AuthViewViewModel.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import Foundation
import FirebaseAuth

/// Describes the ViewModel for user's authentication form on AuthView. Configures fields like password and email, fields validation.
final class AuthViewViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    
    // MARK: - Lifecycle
    
    init() {
        
    }
    
    
    func logIn() {
        guard validate() else {
            return
        }
        
    //    Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    

    
    /// Validate user's input in e-mail and password fields.
    /// - Returns: 1) true - if e-mail input contains "@" and ".", and if all the fields are filled in; 2) false - if any of these condiditons are not fulfilled.
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please, fill in all fields"
            return false
        }
        
//        Contains email@foo.com
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please, enter valid e-mail adress"
            return false
        }
        return true
    }
}
