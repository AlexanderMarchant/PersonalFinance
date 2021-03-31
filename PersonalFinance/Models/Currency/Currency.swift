//
//  Currency.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import Foundation

enum Currency: String, CaseIterable {
    case GBP
    case EUR
    case USD
}

extension Currency {
    
    func getCurrencyName() -> String {
        switch self {
        case .GBP:
            return "Great British Pound"
        case .EUR:
            return "Euros"
        case .USD:
            return "US Dollars"
        }
    }
    
    func getSymbol() -> String {
        switch self {
        case .GBP:
            return "£"
        case .EUR:
            return "€"
        case .USD:
            return "$"
        }
    }
    
}
