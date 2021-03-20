//
//  Double-Round.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
