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
        Account(name: "Testing", balance: 534829.23321, interest: 6.23, fixedInterest: true, currency: .GBP)
    ]
    
    var body: some Scene {
        WindowGroup {
            
            ExistingSavingsView(existingSavingsViewModel: ExistingSavingsViewModel(accounts))
        }
    }
}
