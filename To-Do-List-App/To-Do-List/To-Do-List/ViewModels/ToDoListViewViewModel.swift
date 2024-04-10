//
//  ToDoTasksViewViewModel.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import Foundation
import FirebaseFirestore

/// ViewModel for list of items view
/// Primary tab
final class ToDoListViewViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var showingNewItemView = false
    private var userID: String
    
    // MARK: - Init

    init(userID: String) {
        self.userID = userID
    }
    
    /// Delete to-do list item
    /// - Parameter id:  item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    }
}
 
