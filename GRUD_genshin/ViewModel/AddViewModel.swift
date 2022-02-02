//
//  AddViewModel.swift
//  GRUD_genshin
//
//  Created by Максим Нуждин on 02.02.2022.
//

import Foundation


extension AddView {
    
    @MainActor class ViewModel: ObservableObject {
        
        @Published var name = ""
        @Published var element: GenshinCharacterAdditions.Element = .pyro
        @Published var region: GenshinCharacterAdditions.Region = .mondstadt
        @Published var releasedVersion: Double = 1.0
        
        var isDisabled: Bool {
            name.isEmpty
        }
    }
}
