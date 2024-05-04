//
//  Contact.swift
//  ContactList
//
//  Created by richard Haynes on 5/4/24.
//

import Foundation
// example of functions
func makeBirthDate(year: Int, month: Int, day: Int) -> Date? {
    // example of variables
    let parts : DateComponents = DateComponents(year: year, month: month, day:day)
    let date : Date = Calendar.current.date(from: parts)!
    return date
}
// example of structs
struct Contact: Identifiable {
    let id: UUID = UUID()
    let firstname: String
    let middleName: String?
    let lastName: String
    let birthDay: Date?
    let number: String
    
    func getFullName() -> String {
        guard let middleName = self.middleName else {
            let fullname = "\(firstname) \(lastName)"
            return fullname
        }
        return "\(firstname) \(middleName) \(lastName)"
    }
    
    func canDrink() -> Bool {
        guard let date = self.birthDay else {
            return false
        }
        
        let today = Date()
        // example of conditionals (if)
        if today.timeIntervalSince(date) < 18 {
            return false
        }
        return true
    }
}
