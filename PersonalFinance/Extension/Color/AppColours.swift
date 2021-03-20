//
//  AppColours.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 18/03/2021.
//

import Foundation
import SwiftUI

extension Color {
    
    static var background: Color {
        return Color("background")
    }
    
    static var body: Color {
        return Color("body")
    }
    
    static var shadow: Color {
        return Color("shadow")
    }
    
}

extension UIColor {
    
    static var background: UIColor {
        return UIColor(named: "background")!
    }
    
    static var body: UIColor {
        return UIColor(named: "body")!
    }
}
