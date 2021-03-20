//
//  Currency.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import Foundation

enum Currency {
    case GBP
    case EUR
    case USD
}

extension Currency {
    
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
