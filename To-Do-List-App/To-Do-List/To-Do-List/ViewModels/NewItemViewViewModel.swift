//
//  NewItemViewViewModel.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// A View Model for creating a new to-do list item view (being shown in a modal way)
final class NewItemViewViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
 
    // MARK: - Lifecycle

    init() {}
    
    // MARK: - Save new to-do item to Firestore

    func save() {
        guard canSave else {
            return
        }
//        Get current user ID (task item is being written into a sub-collection of current user record in Firestore)
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
//        Create a to-do list item model instance
        let newID = UUID().uuidString
        let newItem = ToDoListItem(id: newID,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
//        Save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newID)
//        to be able to convert the model above into dictionary and save it in the database
            .setData(newItem.asDisctionary() ) // a dictionary
    }
    
    
    // MARK: - Validate new task input

    var canSave: Bool {
//        Title should not be empty
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
//        Due date should be greater or equal to yesterday
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
