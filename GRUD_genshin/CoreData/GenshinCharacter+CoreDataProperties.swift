//
//  GenshinCharacter+CoreDataProperties.swift
//  GRUD_genshin
//
//  Created by Максим Нуждин on 02.02.2022.
//
//

import Foundation
import CoreData


extension GenshinCharacter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GenshinCharacter> {
        return NSFetchRequest<GenshinCharacter>(entityName: "GenshinCharacter")
    }

    @NSManaged public var patch: Double
    @NSManaged public var element: String?
    @NSManaged public var region: String?
    @NSManaged public var name: String?
    @NSManaged public var isFavorite: Bool
    
    var wrappedElement: String {
        element ?? "unknown element"
    }
    
    var wrappedRegion: String {
        region ?? "unknown region"
    }
    
    var wrappedName: String {
        name ?? "unknown"
    }
}

extension GenshinCharacter : Identifiable {

}
