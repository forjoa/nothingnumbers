//
//  Category.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import Foundation
import SwiftData

@Model
class Category {
    var name: String
    var colorHex: String
    
    init(name: String, colorHex: String) {
        self.name = name
        self.colorHex = colorHex
    }
}