//
//  SavingsCardViewModel.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import Foundation
import SwiftUI

extension SavingsCardView {
    
    class ViewModel: ObservableObject {
        
        @Binding private var account: Account
        
        var balance: String {
            return "\(self.account.currency.getSymbol())\(account.balance)"
        }
        
        var name: String {
            self.account.name
        }
        
        var interest: String {
            guard let interest = account.interest else { return "" }
            
            return "\(interest)%"
        }
        
        var interestType: String {
            guard let _ = account.interest else { return "" }
            
            if(account.fixedInterest) {
                return "Fixed"
            } else {
                return "Variable"
            }
        }
        
        init(_ account: Binding<Account>) {
            self._account = account
        }
        
        func getAccountId() -> String {
            return self.account.id
        }
        
    }
    
}
