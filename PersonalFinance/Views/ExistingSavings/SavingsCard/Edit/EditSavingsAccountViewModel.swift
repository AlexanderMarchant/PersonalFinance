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
        @Published var balance: Double!
        @Published var interest: Double?
        @Published var fixedInterest: Bool!
        @Published var currency: Currency!
        
        init(_ accountToUpdate: Binding<Account>) {
            self._account = accountToUpdate
            
            self.name = account.name
            self.balance = account.balance
            self.interest = account.interest
            self.fixedInterest = account.fixedInterest
            self.currency = account.currency
        }
        
        func updateAccount() {
            account.name = self.name
            account.balance = self.balance
            account.interest = self.interest
            account.fixedInterest = self.fixedInterest
            account.currency = self.currency
        }
        
        
    }
    
}
