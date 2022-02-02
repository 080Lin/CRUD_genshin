//
//  DetailScreen.swift
//  GRUD_genshin
//
//  Created by Максим Нуждин on 02.02.2022.
//

import SwiftUI

struct DetailScreen: View {
    
    @StateObject var model = ViewModel()
    let character: GenshinCharacter
    
    var body: some View {
        VStack {
            TextField("Name", text: $model.name)
            Picker("Region", selection: $model.region) {
                ForEach(GenshinCharacterAdditions.Region.allCases, id: \.self) { reg in
                    Text(reg.rawValue)
                }
            }
            Picker("element", selection: $model.element) {
                ForEach(GenshinCharacterAdditions.Element.allCases, id: \.self) { el in
                    Text(el.rawValue)
                }
            }
        }
        
        Button("UPD") {
            if !model.name.isEmpty {
                character.name = model.name
            }
            character.region = model.region.rawValue
            CoreDataManager.shared.save()
        }
    }
}

