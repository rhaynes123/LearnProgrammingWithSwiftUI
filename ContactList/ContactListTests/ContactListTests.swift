//
//  ContactListTests.swift
//  ContactListTests
//
//  Created by richard Haynes on 5/4/24.
//

import XCTest
@testable import ContactList

final class ContactListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCanDrink() throws {
       let contact = Contact(firstname: "Robert", middleName: nil, lastName: "Martin", birthDay: makeBirthDate(year: 1991, month: 3, day: 5), number: "313-558-2642")
        let candrink = contact.canDrink()
        XCTAssertTrue(candrink)
    }
    
    func testCanNotDrinkBecauseThereIsNoBirthday() throws {
        let contact = Contact(firstname: "Robert", middleName: nil, lastName: "Martin", birthDay: nil, number: "313-558-2642")
        let candrink = contact.canDrink()
        XCTAssertFalse(candrink)
    }
    
    func testCanNotDrinkBecauseTooYoung() throws {
        let contact = Contact(firstname: "Robert", middleName: nil, lastName: "Martin", birthDay: Date(), number: "313-558-2642")
        let candrink = contact.canDrink()
        XCTAssertFalse(candrink)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
