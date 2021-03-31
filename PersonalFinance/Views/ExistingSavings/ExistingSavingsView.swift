//
//  ExistingSavingsView.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 19/03/2021.
//

import SwiftUI

struct ExistingSavingsView: View {
    
    @StateObject var viewModel: ViewModel
    
    @State private var idOfItemToDelete: String? = nil
    @State private var cardsAreExpanded = false
    
    var body: some View {
        
        ScrollView(.vertical) {
            
            VStack(spacing: 10) {
                
                ZStack {
                    ForEach(self.viewModel.accounts) { account in
                        
                        let count = viewModel.accounts.count - 1
                        
                        SavingsCardView(
                            idOfItemToDelete: self.$idOfItemToDelete,
                            editingIsEnabled: self.$cardsAreExpanded,
                            viewModel: .init(self.$viewModel.accounts[count - self.viewModel.accounts.firstIndex(where: { $0.id == account.id })!])
                        )
                        .offset(
                            CGSize(
                                width: 0,
                                height: handleOffset(cardHeight: 100, count - self.viewModel.accounts.firstIndex(where: { $0.id == account.id })! + 1)
                            )
                        )
                        
                    }
                    .onChange(of: self.idOfItemToDelete) { _ in
                        if let id = self.idOfItemToDelete {
                            self.viewModel.removeAccount(with: id)
                            self.idOfItemToDelete = nil
                        }
                    }
                    
                    SavingsCardView(
                        idOfItemToDelete: .constant(nil),
                        editingIsEnabled: .constant(false),
                        viewModel: .init(
                            .constant(
                                Account(
                                    name: "Total Savings",
                                    balance: viewModel.totalSavings,
                                    interest: nil,
                                    fixedInterest: false,
                                    currency: .EUR
                                )
                            )
                        )
                    )
                    .offset(CGSize(width: 0, height: handleOffset(cardHeight: 100, 0)))
                    .onTapGesture {
                        withAnimation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 15, initialVelocity: 0)) {
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
            viewModel: .init([
                Account(name: "Test", balance: 100000, interest: nil, fixedInterest: false, currency: .GBP),
                
                Account(name: "Test2", balance: 500, interest: 12.325, fixedInterest: true, currency: .GBP),
                
                Account(name: "Test3", balance: 6437.542, interest: 3.43, fixedInterest: false, currency: .GBP)
            ]))
    }
}
