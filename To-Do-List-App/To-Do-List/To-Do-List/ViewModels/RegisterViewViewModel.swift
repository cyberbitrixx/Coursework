//
//  RegisterViewViewModel.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class RegisterViewViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    
    // MARK: - Lifecycle
    
    init() {
        
    }
    
//    Need to create a real data record within Firebase
    func register() {
        guard validate() else {
            return
        }
        
//        Create a new user record in the database
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
//         Instantiate a database, insert the User object into database as Dictionary
        let dataBase = Firestore.firestore()
         
        dataBase.collection("users")
            .document(id)
            .setData(newUser.asDisctionary())
    }
    
//    Validate user's input for fields similar to what we did with Auth validation
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in : .whitespaces).isEmpty else {
            return false
        }

        guard !password.isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }

}
