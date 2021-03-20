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
            
            HStack {
                Text(buttonTitle)
                    .font(Fonts.buttonFont)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
        })
    }
}

struct PFPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PFPrimaryButton(
            buttonTitle: "Testing",
            action: { print("You pressed me") })
    }
}
