
//
//  CategoryFormViewModel.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import Foundation
import SwiftUI
import SwiftData

class CategoryFormViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var colorHex: String = "#27F53F"
    
    func saveCategory(in context: ModelContext) {
        let newCategory = Category(name: name, colorHex: colorHex)
        context.insert(newCategory)
    }
}
