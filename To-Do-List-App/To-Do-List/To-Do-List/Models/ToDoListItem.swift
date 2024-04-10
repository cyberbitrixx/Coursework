//
//  ToDoListItem.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import Foundation

/// A data model that represent a single to-do list item
struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func checkedDone(_ state: Bool) {
        isDone = state
    }
}
 
