//
//  ExistingSavingsViewModel.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import Foundation

extension ExistingSavingsView {
    
    class ViewModel: ObservableObject {
        
        @Published var accounts: [Account]
        @Published var totalSavings: Double
        
        init(_ accounts: [Account] = [Account]()) {
            self.accounts = accounts.sorted(by: { $0.balance > $1.balance })
            
            var calculatedSavings: Double = 0
            
            accounts.forEach({ account in
                calculatedSavings += account.balance
            })
            
            self.totalSavings = calculatedSavings
        }
        
        func removeAccount(with id: String) {
            self.accounts.removeAll(where: { $0.id == id })
        }
        
    }
    
}
