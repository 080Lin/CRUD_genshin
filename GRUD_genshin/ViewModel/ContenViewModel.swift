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
        
        @Environment(\.managedObjectContext) var viewContext
        
        // think bout it later on
        //        @FetchRequest(sortDescriptors: [], animation: .default)
        //        var characters: FetchedResults<GenshinCharacter>
        
        
        @Published var showAddView: Bool = false
    }
}
