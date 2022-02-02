//
//  DetailViewModel.swift
//  GRUD_genshin
//
//  Created by Максим Нуждин on 02.02.2022.
//

import Foundation

extension DetailScreen {
    
    @MainActor class ViewModel: ObservableObject {
        
//        let character: GenshinCharacter
        @Published var name: String = ""
        @Published var region: GenshinCharacterAdditions.Region = .mondstadt
        @Published var element: GenshinCharacterAdditions.Element = .pyro
    }
}
