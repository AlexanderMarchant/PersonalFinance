//
//  ExistingSavingsView.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import SwiftUI

struct ExistingSavingsView: View {
    
    @ObservedObject var existingSavingsViewModel: ExistingSavingsViewModel
    
    @State var cardsAreExpanded = false
    
    var body: some View {
        
        ScrollView(.vertical) {
            
            VStack(spacing: 10) {
                
                ZStack {
                    ForEach(0 ..< existingSavingsViewModel.accounts.count) { index in
                        
                        let count = existingSavingsViewModel.accounts.count - 1
                        
                        let viewModel = SavingsCardViewModel(existingSavingsViewModel.accounts[count - index])
                        
                        SavingsCardView(editingIsEnabled: self.$cardsAreExpanded, savingsCardViewModel: viewModel)
                            .offset(CGSize(width: 0, height: handleOffset(cardHeight: 100, count - index + 1)))
                        
                    }
                    
                    SavingsCardView(editingIsEnabled: Binding<Bool>.constant(false), savingsCardViewModel: SavingsCardViewModel(Account(name: "Total Savings", balance: existingSavingsViewModel.totalSavings, interest: nil, fixedInterest: false, currency: .EUR)))
                        .offset(CGSize(width: 0, height: handleOffset(cardHeight: 100, 0)))
                        .onTapGesture {
                            withAnimation {
                                self.cardsAreExpanded.toggle()
                            }
                        }
                }
            }
        }
    }
    
    func handleOffset(cardHeight: Int, _ index: Int) -> Int {
        if cardsAreExpanded {
            return index * (cardHeight + 10)
        } else {
            return index * 10
        }
    }
}

struct ExistingSavingsView_Previews: PreviewProvider {
    static var previews: some View {
        ExistingSavingsView(
            existingSavingsViewModel: ExistingSavingsViewModel([
                Account(name: "Test", balance: 100000, interest: nil, fixedInterest: false, currency: .GBP),
                
                Account(name: "Test2", balance: 500, interest: 12.325, fixedInterest: true, currency: .GBP),
                
                Account(name: "Test3", balance: 6437.542, interest: 3.43, fixedInterest: false, currency: .GBP)
            ]))
    }
}
