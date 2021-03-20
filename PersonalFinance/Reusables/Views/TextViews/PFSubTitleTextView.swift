//
//  PFSubTitleTextView.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import SwiftUI

struct PFSubTitleTextView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
    }
}

struct PFSubTitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        PFSubTitleTextView(text: "Testing")
    }
}
