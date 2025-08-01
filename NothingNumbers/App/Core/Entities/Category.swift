//
//  Category.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import Foundation
import CoreData

@objc(Category)
class Category: NSManagedObject {
    
    @nonobjc class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged var name: String
    @NSManaged var colorHex: String?
    @NSManaged var numbers: NSSet?

    @objc(addNumbersObject:)
    @NSManaged func addToNumbers(_ value: Numbers)

    @objc(removeNumbersObject:)
    @NSManaged func removeFromNumbers(_ value: Numbers)

    @objc(addNumbers:)
    @NSManaged func addToNumbers(_ values: NSSet)

    @objc(removeNumbers:)
    @NSManaged func removeFromNumbers(_ values: NSSet)
}
