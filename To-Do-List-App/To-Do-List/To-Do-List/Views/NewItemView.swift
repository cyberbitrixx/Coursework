//
//  NewItemView.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import SwiftUI

struct NewItemView: View {
    
    // MARK: - Properties and View Model

    @StateObject private var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    
    // MARK: - New Item view

    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            
            // MARK: - Show New Item Form

            Form {
//                Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())

//                Due Date
                    DatePicker("Due Date", selection: $viewModel.dueDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                
//                Save Button
                    TLButton(title: "Save", background: .pink) {
//                         Validate new task input (.canSave)
                        if viewModel.canSave {
                            viewModel.save()
                            newItemPresented = false
                        } else {
//                            Show alert
                            viewModel.showAlert = true
                        }
                    }
                .padding()
            }
//           Show alert if something's wrong with input
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and choose date which is today or later"))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
