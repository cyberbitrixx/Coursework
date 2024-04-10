//
//  ToDoListItemViewViewModel.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


/// ViewModel for sigle to do list item view (each row in items list)
final class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
//        Inverse logic (if item is checked "done" - uncheck, otherwise - do the opposite )
        itemCopy.checkedDone(!itemCopy .isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDisctionary())
    }
}
