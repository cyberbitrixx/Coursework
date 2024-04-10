//
//  ProfileViewViewModel.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class ProfileViewViewModel: ObservableObject {
    
    // MARK: - Properties
    
//    User is optional and nil by default since we never have it atm and and we need to fetch it from the DB
    @Published var user: User? = nil

    // MARK: - Lifecycle

    init() {}
    
    
    // MARK: - Fetch user
    
    func fetchUser() {
//        Fetch the userID from Firestore
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
//        Instantiate the database
        let db = Firestore.firestore()
//        Go to the DB collection "users" and fetch the user's document identified with userID
        // MARK: - BROKEN WINDOW: "users" collection is what we had a problem with
        db.collection("users").document(userID).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
//            Indicate that User assigning should be in Main queue since it will trigger changes in UI (in ProfileView)
                DispatchQueue.main.async {
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                        name: data["name"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        joined: data["joined"] as? TimeInterval ?? 0)
                }
        }
    }

    
    // MARK: - Log Out
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }

}
