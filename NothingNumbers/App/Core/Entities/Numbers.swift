//
//  Numbers.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import Foundation
import SwiftData

enum NumbersType: Codable {
    case income
    case expense
}

@Model
class Numbers {
    var value: Double
    var note: String?
    var date: Date
    var type: NumbersType
    var category: Category?
    
    init(value: Double, note: String? = nil, date: Date, type: NumbersType, category: Category? = nil) {
        self.value = value
        self.note = note
        self.date = date
        self.type = type
        self.category = category
    }
}