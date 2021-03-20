//
//  ExistingSavingsView.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import SwiftUI

struct ExistingSavingsView: View {
    
    @ObservedObject var existingSavingsViewModel: ExistingSavingsViewModel
    
    var body: some View {
        SavingsCardView(savingsCardViewModel: SavingsCardViewModel(existingSavingsViewModel.accounts[0]))
    }
}

struct ExistingSavingsView_Previews: PreviewProvider {
    static var previews: some View {
        ExistingSavingsView(
            existingSavingsViewModel: ExistingSavingsViewModel())
    }
}
