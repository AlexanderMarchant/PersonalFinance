//
//  EditSavingsAccountView.swift
//  PersonalFinance
//
//  Created by Alex Marchant on 31/03/2021.
//

import SwiftUI

struct EditSavingsAccountView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedCurrency: Currency = Currency.GBP
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Account Name")) {
                    TextField("", text: $viewModel.name)
                }
                Section(header: Text("Current Balance")) {
                    TextField("", value: $viewModel.balance, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                    Picker(selection: $selectedCurrency, label: Text("Currency")) {
                        ForEach(Currency.allCases, id: \.self) { element in
                            Text(element.getCurrencyName())
                        }
                    }
                }
                Section(
                    header: Text("Interest"),
                    footer:
                        PFPrimaryButton(
                            buttonTitle: "Save Changes",
                            action: {
                                self.viewModel.updateAccount()
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        )
                        .padding(.vertical)
                ) {
                    Group {
                        TextField("", value: $viewModel.interest, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                        
                            Toggle(isOn: $viewModel.fixedInterest) {
                                Text("Fixed Interest")
                            }
                    }
                }
            }
            .navigationTitle(Text("Edit Account"))
        }
    }
}

struct EditSavingsAccount_Previews: PreviewProvider {
    static var previews: some View {
        EditSavingsAccountView(
            viewModel: .init(
                .constant(Account(
                            name: "Testing",
                            balance: 11000.11,
                            interest: 6.34,
                            fixedInterest: false,
                            currency: .GBP)
                )
            )
        )
    }
}
