//
//  Persistence.swift
//  GRUD_genshin
//
//  Created by Максим Нуждин on 01.02.2022.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CRUD_genshin")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func save() {
        let context = container.viewContext
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
            print(error)
        }
    }
}
