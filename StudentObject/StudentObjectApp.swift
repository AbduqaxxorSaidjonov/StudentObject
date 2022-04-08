//
//  StudentObjectApp.swift
//  StudentObject
//
//  Created by Abduqaxxor on 8/4/22.
//

import SwiftUI

@main
struct StudentObjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
