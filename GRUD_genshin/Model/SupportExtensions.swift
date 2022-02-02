//
//  SupportExtensions.swift
//  GRUD_genshin
//
//  Created by Максим Нуждин on 02.02.2022.
//

import Foundation


extension Double {
    
    func preciseTo(_ num: Int) -> String {
        return String(format: "%.\(num)f", self)
    }
}
