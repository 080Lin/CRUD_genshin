//
//  GRUD_genshinApp.swift
//  GRUD_genshin
//
//  Created by Максим Нуждин on 01.02.2022.
//

import SwiftUI

@main
struct GRUD_genshinApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
