//
//  AddViewModel.swift
//  GRUD_genshin
//
//  Created by Максим Нуждин on 02.02.2022.
//

import Foundation
import CoreData
import SwiftUI

extension AddView {
    
    @MainActor class ViewModel: ObservableObject {
        
        @Environment(\.dismiss) var dismiss
        
        @Published var name = ""
        @Published var element: GenshinCharacterAdditions.Element = .pyro
        @Published var region: GenshinCharacterAdditions.Region = .mondstadt
        @Published var releasedVersion: Double = 1.0
        
        var isDisabled: Bool {
            name.isEmpty
        }
        
        func addNewChar() {
            let char = GenshinCharacter(context: CoreDataManager.shared.viewContext)
            char.name = name
            char.region = region.rawValue
            char.element = element.rawValue
            char.patch = releasedVersion
            char.isFavorite = false
            
            CoreDataManager.shared.save()
        }
    }
}
