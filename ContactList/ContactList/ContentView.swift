//
//  ContentView.swift
//  ContactList
//
//  Created by richard Haynes on 5/4/24.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    // example of arrays
    @Environment(\.modelContext) private var context
    @Query
    private var contacts : [Contact]
    
    @State private var showForm : Bool = false
    var body: some View {
        VStack {
            Image(systemName: "person")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Contacts!").font(.title)
            
            List {
                // example of loops
                ForEach(contacts) {contact in
                    Text("Name: \(contact.getFullName())")
                    Text("Number: \(contact.number)")
                    if let date = contact.birthDay {
                        Text("Birthday: \(date, format: Date.FormatStyle(date: .abbreviated))")
                    }
                    Toggle(isOn: .constant(contact.canDrink()), label: {
                        Text("Can Drink")
                    })
                }
            }
            
            Button("Add New Contact"){
                showForm.toggle()
            }.sheet(isPresented:$showForm){
                AddContactView()
            }
        }
        .padding()
    }
}

#Preview {
    let container = try! ModelContainer(for: Contact.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    let sample = Contact(firstname: "Robert", middleName: nil, lastName: "Martin", birthDay: makeBirthDate(year: 1950, month: 12, day: 5), number: "313-558-2642")
    container.mainContext.insert(sample)
    return ContentView().modelContainer(container)
}
