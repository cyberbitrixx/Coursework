//
//  MainViewViewModel.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import Foundation
import FirebaseAuth


final class MainViewViewModel: ObservableObject {
    @Published var currentUserID: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
//        Allows to observe from Firebase when the current user changes (signs in/signs out) @Published property will be triggered
        self.handler = Auth.auth().addStateDidChangeListener {[weak self ] _, user in
//            Assigning the published property in main thread because it will update UI (UI changes should always be performed in main thread )
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
