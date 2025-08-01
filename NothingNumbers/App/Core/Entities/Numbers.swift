//
//  Numbers.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import Foundation
import CoreData

@objc(Numbers)
class Numbers: NSManagedObject {
    
    @nonobjc class func fetchRequest() -> NSFetchRequest<Numbers> {
        return NSFetchRequest<Numbers>(entityName: "Numbers")
    }

    @NSManaged var value: Double
    @NSManaged var note: String?
    @NSManaged var date: Date
    @NSManaged var category: Category
}
