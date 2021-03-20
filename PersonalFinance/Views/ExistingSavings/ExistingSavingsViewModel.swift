//
//  ExistingSavingsViewModel.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import Foundation

public class ExistingSavingsViewModel: ObservableObject {
    
    @Published var accounts: [Account]
    
    init(_ accounts: [Account] = [Account]()) {
        self.accounts = accounts
    }
    
}
