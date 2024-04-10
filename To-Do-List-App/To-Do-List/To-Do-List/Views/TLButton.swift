//
//  TLButton.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import SwiftUI

/// A custom reusable Button type, can be used in other Views. Provides properties for defining a button's title, color and a place for custom action.
struct TLButton: View {
    
    // MARK: - Properties

    let title: String
    let background: Color
    let action: () -> Void
    
    
    // MARK: - Button appearance

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Title", background: .pink, action: {
//            Action 
        })
    }
}
