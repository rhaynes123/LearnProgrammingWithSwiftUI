//
//  AddContactView.swift
//  ContactList
//
//  Created by richard Haynes on 5/4/24.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var firstname: String = ""
    @State private var middlename: String = ""
    @State private var lastname: String = ""
    @State private var phoneNumber: String = ""
    @State private var birthdate: Date = Date()
    private func saveContact() {
        let newContact = Contact(firstname: self.firstname, middleName: self.middlename, lastName: self.lastname, birthDay: self.birthdate, number: self.phoneNumber)
        context.insert(newContact)
        
    }
    var body: some View {
        Form {
            Section {
                TextField("First Name", text: $firstname)
                TextField("Middle Name", text: $middlename)
                TextField("Last Name", text: $lastname)
            }
            
            Section {
                TextField("Phone Number", text: $phoneNumber )
            }
            
            Section {
                DatePicker("Birth Day", selection: $birthdate)
            }
            
            
        }
        
        HStack{
            Button("Save"){
                saveContact()
                dismiss()
            }
            
            Button("Cancel"){
                dismiss()
            }
        }
    }
}

#Preview {
    AddContactView()
}
