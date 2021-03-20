//
//  PFActionButton.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 20/03/2021.
//

import SwiftUI

struct PFActionButton: View {
    
    var buttonImage: String
    var backgroundColour: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action, label: {
            
            Image(buttonImage)
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
            .frame(width: 25, height: 25)
            .padding()
            .background(backgroundColour)
            .cornerRadius(30)
        })
        .shadow(color: backgroundColour.opacity(0.5), radius: 4)
    }
}

struct PFActionButton_Previews: PreviewProvider {
    static var previews: some View {
        PFActionButton (
            buttonImage: "edit-icon",
            backgroundColour: Color.blue,
            action: { print("You pressed me") })
    }
}
