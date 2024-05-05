//
//  ContactListApp.swift
//  ContactList
//
//  Created by richard Haynes on 5/4/24.
//

import SwiftUI
import SwiftData
@main
struct ContactListApp: App {
    var sharedModelContainer: ModelContainer = {
            let schema = Schema([
                Contact.self
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
