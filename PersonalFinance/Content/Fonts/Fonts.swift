//
//  Fonts.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 18/03/2021.
//

import Foundation
import SwiftUI

struct Fonts {
    
    static var titleFont: Font {
        return Font.system(size: 26, weight: .bold, design: .default)
    }
    
    static var subTitleFont: Font {
        return Font.system(size: 22, weight: .bold, design: .default)
    }
    
    static var headerFont: Font {
        return Font.system(size: 18, weight: .semibold, design: .default)
    }
    
    static var subHeaderFont: Font {
        return Font.system(size: 16, weight: .medium, design: .default)
    }
    
    static var buttonFont: Font {
        return Font.system(size: 18, weight: .semibold, design: .default)
    }
    
    static var bodyFont: Font {
        return Font.system(size: 16, weight: .regular, design: .default)
    }
    
    static var captionFont: Font {
        return Font.system(size: 14, weight: .regular, design: .default)
    }
}
