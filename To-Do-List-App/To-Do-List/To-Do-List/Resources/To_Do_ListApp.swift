//
//  To_Do_ListApp.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import FirebaseCore
import SwiftUI


@main
struct To_Do_ListApp: App {
    
//    Connect the app to backend
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
