//
//  Account.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import Foundation

struct Account: Identifiable {
    
    let id: String
    var name: String
    var balance: Double
    var interest: Double?
    var fixedInterest: Bool
    var currency: Currency
    
    init(name: String, balance: Double, interest: Double?, fixedInterest: Bool, currency: Currency) {
        self.id = UUID().uuidString
        self.name = name
        self.balance = balance.round(to: 2)
        self.interest = interest?.round(to: 2)
        self.fixedInterest = fixedInterest
        self.currency = currency
    }
}
