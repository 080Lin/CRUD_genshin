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
    }
}
