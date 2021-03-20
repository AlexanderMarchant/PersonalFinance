//
//  PFBodyTextView.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 18/03/2021.
//

import SwiftUI

struct PFBodyTextView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(Fonts.bodyFont)
            .foregroundColor(Color.body)
    }
    
}

struct PFBodyTextView_Previews: PreviewProvider {
    static var previews: some View {
        PFBodyTextView(text: "Testing")
    }
}
