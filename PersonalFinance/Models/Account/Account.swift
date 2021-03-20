//
//  Account.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import Foundation

struct Account {
    
    let name: String
    let balance: Double
    let interest: Double?
    let fixedInterest: Bool
    let currency: Currency
    
    init(name: String, balance: Double, interest: Double?, fixedInterest: Bool, currency: Currency) {
        self.name = name
        self.balance = balance.round(to: 2)
        self.interest = interest?.round(to: 2)
        self.fixedInterest = fixedInterest
        self.currency = currency
    }
}
