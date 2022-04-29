//
//  food.swift
//  Nano challenge 1 Vincents PB
//
//  Created by Vincents Putra Barata on 28/04/22.
//

import CoreData

@objc(food)
class food: NSManagedObject {
    @NSManaged var foodName: String!
    @NSManaged var id: NSNumber!
    @NSManaged var lifeSpan: Date?
    @NSManaged var notes: String!
    @NSManaged var tagsCategory: String!
}
