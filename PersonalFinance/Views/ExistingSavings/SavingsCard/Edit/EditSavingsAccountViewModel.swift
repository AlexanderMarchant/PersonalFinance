//
//  EditSavingsAccountViewModel.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 31/03/2021.
//

import Foundation
import SwiftUI

extension EditSavingsAccountView {
    
    class ViewModel: ObservableObject {
        
        @Binding private var account: Account
        
        @Published var name: String!
        @Published var balance: String!
        @Published var interest: String!
        @Published var fixedInterest: Bool!
        @Published var currency: Currency = Currency.EUR
        
        init(_ accountToUpdate: Binding<Account>) {
            self._account = accountToUpdate
            
            self.name = account.name
            self.balance = String(account.balance)
            self.interest = String(account.interest ?? 0)
            self.fixedInterest = account.fixedInterest
            self.currency = account.currency
        }
        
        func updateAccount() {
            account.name = self.name
            account.balance = Double(self.balance) ?? 0
            account.interest = Double(self.interest) ?? 0
            account.fixedInterest = self.fixedInterest
            account.currency = self.currency
        }
        
    }
    
}
