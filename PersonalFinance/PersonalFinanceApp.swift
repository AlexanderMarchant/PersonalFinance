//
//  PersonalFinanceApp.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 18/03/2021.
//

import SwiftUI

@main
struct PersonalFinanceApp: App {
    
    let accounts = [
        Account(name: "Testing", balance: 534829.23321, interest: 6.23, fixedInterest: true, currency: .GBP),
        Account(name: "Test", balance: 100000, interest: nil, fixedInterest: false, currency: .GBP),
        Account(name: "Test2", balance: 500, interest: 12.325, fixedInterest: true, currency: .EUR),
        Account(name: "Test3", balance: 6437.542, interest: 3.43, fixedInterest: false, currency: .USD)
    ]
    
    var body: some Scene {
        WindowGroup {
            
            ExistingSavingsView(existingSavingsViewModel: ExistingSavingsViewModel(accounts))
        }
    }
}
