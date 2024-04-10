//
//  AuthHeaderView.swift
//  To-Do-List
//
//  Created by sofia on 06.02.2024.
//

import SwiftUI

///  A custom reusable HeaderView configuration, which can be used in other Views. Contains a title and subtitle properties and HeaderView's configurations logic.
struct HeaderView: View {
    
    // MARK: - Properties

    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
            }
            .padding(.top, 140)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -180)
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .pink)
    }
}
