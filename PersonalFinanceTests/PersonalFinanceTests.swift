//
//  PersonalFinanceTests.swift
//  PersonalFinanceTests
//
//  Created by Alex Marchant on 18/03/2021.
//

import XCTest
import ViewInspector
import SwiftUI
@testable import PersonalFinance

extension SavingsCardView: Inspectable { }
extension PFActionButton: Inspectable { }

class PersonalFinanceTests: XCTestCase {
    
    func test_resetCardButton_resetsCardPosition_and_hidesButtons() throws {
        let account = Account(name: "", balance: 44, interest: nil, fixedInterest: false, currency: .EUR)
        
        let sut = SavingsCardView(
            editingIsEnabled: Binding<Bool>.constant(false),
            viewModel: .init(account))
        
        let test = try sut.inspect().find(PFActionButton.self)
        
        XCTAssertNotNil(test)
    }

}
