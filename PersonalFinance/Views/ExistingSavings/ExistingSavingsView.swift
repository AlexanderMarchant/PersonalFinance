//
//  ExistingSavingsView.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import SwiftUI

struct ExistingSavingsView: View {
    
    @ObservedObject var existingSavingsViewModel: ExistingSavingsViewModel
    
    var body: some View {
        
        ScrollView(.vertical) {
            ForEach(0 ..< existingSavingsViewModel.accounts.count) { index in
                
                SavingsCardView(savingsCardViewModel: SavingsCardViewModel(existingSavingsViewModel.accounts[index]))
                
            }
        }
    }
}

struct ExistingSavingsView_Previews: PreviewProvider {
    static var previews: some View {
        ExistingSavingsView(
            existingSavingsViewModel: ExistingSavingsViewModel([
                Account(name: "Test", balance: 100000, interest: nil, fixedInterest: false, currency: .GBP),
                
                Account(name: "Test2", balance: 500, interest: 12.325, fixedInterest: true, currency: .GBP),
                
                Account(name: "Test3", balance: 6437.542, interest: 3.43, fixedInterest: false, currency: .GBP)
            ]))
    }
}
