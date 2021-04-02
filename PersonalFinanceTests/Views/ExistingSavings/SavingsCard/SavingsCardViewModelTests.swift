//
//  SavingsCardViewModelTests.swift
//  PersonalFinanceTests
//
//  Created by Alex Marchant on 24/03/2021.
//

import XCTest
@testable import PersonalFinance

class SavingsCardViewModelTests: XCTestCase {
    
    var savingsCardViewModel: SavingsCardViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        savingsCardViewModel = nil
    }
    
    func testInit_InterestIsNil() throws {
        // Arrange
        let ACCOUNT = Account(
            name: "Test",
            balance: 10.0,
            interest: nil,
            fixedInterest: true,
            currency: .GBP)
        
        let EXPECTED_BALANCE = "\(ACCOUNT.currency.getSymbol())\(ACCOUNT.balance)"
        
        // Act
        savingsCardViewModel = .init(ACCOUNT)
        
        // Assert
        XCTAssertEqual(EXPECTED_BALANCE, savingsCardViewModel.balance)
        XCTAssertEqual(ACCOUNT.name, savingsCardViewModel.name)
        XCTAssertNil(savingsCardViewModel.interestType)
        XCTAssertNil(savingsCardViewModel.interest)
    }
    
    func testInit_InterestIsNotNil_FixedInterest() throws {
        // Arrange
        let ACCOUNT = Account(
            name: "Test",
            balance: 10.0,
            interest: 6.0,
            fixedInterest: true,
            currency: .GBP)
        
        let EXPECTED_BALANCE = "\(ACCOUNT.currency.getSymbol())\(ACCOUNT.balance)"
        let EXPECTED_INTEREST = "\(ACCOUNT.interest!)%"
        let EXPECTED_INTEREST_TYPE = "Fixed"
        
        // Act
        savingsCardViewModel = .init(ACCOUNT)
        
        // Assert
        XCTAssertEqual(EXPECTED_BALANCE, savingsCardViewModel.balance)
        XCTAssertEqual(ACCOUNT.name, savingsCardViewModel.name)
        XCTAssertEqual(EXPECTED_INTEREST_TYPE, savingsCardViewModel.interestType)
        XCTAssertEqual(EXPECTED_INTEREST, savingsCardViewModel.interest)
    }
    
    func testInit_InterestIsNotNil_VariableInterest() throws {
        // Arrange
        let ACCOUNT = Account(
            name: "Test",
            balance: 10.0,
            interest: 6.0,
            fixedInterest: false,
            currency: .GBP)
        
        let EXPECTED_BALANCE = "\(ACCOUNT.currency.getSymbol())\(ACCOUNT.balance)"
        let EXPECTED_INTEREST = "\(ACCOUNT.interest!)%"
        let EXPECTED_INTEREST_TYPE = "Variable"
        
        // Act
        savingsCardViewModel = .init(ACCOUNT)
        
        // Assert
        XCTAssertEqual(EXPECTED_BALANCE, savingsCardViewModel.balance)
        XCTAssertEqual(ACCOUNT.name, savingsCardViewModel.name)
        XCTAssertEqual(EXPECTED_INTEREST_TYPE, savingsCardViewModel.interestType)
        XCTAssertEqual(EXPECTED_INTEREST, savingsCardViewModel.interest)
    }

}
