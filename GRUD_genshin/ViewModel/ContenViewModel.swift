//
//  ContenViewModel.swift
//  GRUD_genshin
//
//  Created by Максим Нуждин on 02.02.2022.
//

import Foundation
import CoreData
import SwiftUI


extension ContentView {
    
    @MainActor class ViewModel: ObservableObject {
        
        
        @Published var showAddView: Bool = false {
            willSet {
                objectWillChange.send()
                getAllCharacters()
            }
        }
        
        @Published var characters: [GenshinCharacter] = []
        
        
        func getAllCharacters() {
           characters = CoreDataManager.shared.getAllCharacters()
        }

        func deleteCharacter(at offSets: IndexSet) {
            offSets.forEach { ind in
                let char = characters[ind]
                let existChar = CoreDataManager.shared.getCharacterByID(id: char.objectID)
                guard let existChar = existChar else { return }
                CoreDataManager.shared.deleteCharacter(existChar)
            }
            
            getAllCharacters()
        }
    }
}
