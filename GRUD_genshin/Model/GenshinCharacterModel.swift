//
//  GenshinCharacterModel.swift
//  GRUD_genshin
//
//  Created by Максим Нуждин on 02.02.2022.
//

import Foundation
import SwiftUI

final class GenshinCharacterAdditions {
    
    enum Region: String, CaseIterable {
        case mondstadt
        case liyue
        case inazuma
        case sumeru
        case fontain
        case natlan
        case snezhnaya
        case khaenriarh
        case selestia
    }
    
    enum Element: String, CaseIterable {
        case pyro
        case cryo
        case hydro
        case anemo
        case geo
        case electro
        case dendro
    }
    
    static var gameVersions: [Double] {
        var versions = [Double]()
        
        for v in stride(from: 1.0, to: 1.6, by: 0.1) {
            versions.append(v)
        }
        
        for v in stride(from: 2.0, to: 2.5, by: 0.1) {
            versions.append(v)
        }
        
        return versions
    }
}
