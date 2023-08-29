//
//  task4_appApp.swift
//  task4_app
//
//  Created by Erkam Karaca on 29.08.2023.
//

import SwiftUI

@main
struct task4_appApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
