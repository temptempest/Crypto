//
//  CircleButtonView.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName:String
    
    var body: some View {
        withAnimation(.none) {
            Image(systemName: iconName)
        }
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50, alignment: .center)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10,
                x: 0,
                y: 0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(iconName: "info")
                .previewLayout(.sizeThatFits)
            CircleButtonView(iconName: "plus")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

