//
//  ToDoTasksView.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    // MARK: - Properties and View Model

    @StateObject private var viewModel: ToDoListViewViewModel
//    Having a query which will continueously listen for items
    @FirestoreQuery var items: [ToDoListItem]
        
    
    // MARK: - Init
     
    init(userID: String) {
//        users/<id>/todos/<entries>
//        "_" is necessary to use with "items" variable because it's a Property Wrappers convention
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
//        Assigning the View Model rather than having it as already created property (to pass the userID into the View Model's delete() function )
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                            
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List ")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
//                 Leverage if newItemView is being shown atm (false by default) and present it in a modal way when pressing the "plus" button
                    .sheet(isPresented: $viewModel.showingNewItemView) {
                        NewItemView(newItemPresented: $viewModel.showingNewItemView)
                    }
            }
        }
    }
}

struct ToDoTasksView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userID: "mHZtQOdMVJPeHj7CrJcWQH9BaN33")
    }
}
