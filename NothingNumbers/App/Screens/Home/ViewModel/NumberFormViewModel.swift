//
//  NumberFormViewModel.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import Foundation
import SwiftUI
import SwiftData

class NumberFormViewModel: ObservableObject {
    @Published var value: String = ""
    @Published var note: String = ""
    @Published var type: NumbersType = .income
    @Published var selectedCategory: Category? = nil

    func saveNumber(in context: ModelContext) {
        guard let doubleValue = Double(value) else {
            // Handle error: value is not a valid double
            return
        }
        
        let newNumber = Numbers(value: doubleValue, note: note, date: Date(), type: type, category: type == .expense ? selectedCategory : nil)
        context.insert(newNumber)
    }
}