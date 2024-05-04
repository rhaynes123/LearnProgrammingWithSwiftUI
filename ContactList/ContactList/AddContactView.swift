//
//  AddContactView.swift
//  ContactList
//
//  Created by richard Haynes on 5/4/24.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var firstname: String = ""
    @State private var middlename: String = ""
    @State private var lastname: String = ""
    @State private var phoneNumber: String = ""
    @State private var birthdate: Date = Date()
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
        
        Button("Save"){
            dismiss()
        }
    }
}

#Preview {
    AddContactView()
}
