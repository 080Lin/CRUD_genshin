//
//  Persistence.swift
//  GRUD_genshin
//
//  Created by Максим Нуждин on 01.02.2022.
//

import SwiftUI
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print("Unable to save data. \(error)")
        }
    }
    
    func getAllCharacters() -> [GenshinCharacter] {
        let request: NSFetchRequest<GenshinCharacter> = GenshinCharacter.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error)
            return []
        }
    }
    
    func deleteCharacter(_ char: GenshinCharacter) {
        
        persistentContainer.viewContext.delete(char)
        
        save()
    }
    
    private init(inMemory: Bool = false) {
        
        persistentContainer = NSPersistentContainer(name: "CRUD_genshin")
        
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "dev/null")
        }
        
        persistentContainer.loadPersistentStores { description, err in
            if let err = err {
                fatalError(err.localizedDescription)
            }
        }
    }
}
