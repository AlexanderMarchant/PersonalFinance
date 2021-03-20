//
//  SavingsCardViewModel.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import Foundation

public class SavingsCardViewModel: ObservableObject {
    
    let account: Account
    
    var balance: String
    var name: String
    var interestType: String?
    var interest: String?
    
    init(_ account: Account) {
        self.account = account
        
        self.balance = "\(account.currency.getSymbol())\(account.balance)"
        self.name = account.name
        
        if let interest = account.interest {
            self.interest = "\(interest)%"
            
            if(account.fixedInterest) {
                self.interestType = "Fixed"
            } else {
                self.interestType = "Variable"
            }
        }
    }
    
}
