//
//  PFPrimaryButton.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 18/03/2021.
//

import SwiftUI

struct PFPrimaryButton: View {
    
    var buttonTitle: String
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action, label: {
            
            Text(buttonTitle)
                .font(Fonts.buttonFont)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical, 15)
                .foregroundColor(Color.white)
                .background(Color.blue)
        })
        .cornerRadius(10)
        
    }
}

struct PFPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PFPrimaryButton(
            buttonTitle: "Testing",
            action: { print("You pressed me") })
    }
}
