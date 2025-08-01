
//
//  HomeViewModel.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import Foundation
import SwiftUI
import SwiftData

class HomeViewModel: ObservableObject {
    @Published var totalAmount: Double = 0
    @Published var annualAmount: Double = 0
    @Published var monthlyAmount: Double = 0
    @Published var isPresentingForm: Bool = false

    func calculateAmounts(for numbers: [Numbers]) {
        let calendar = Calendar.current
        let now = Date()
        let year = calendar.component(.year, from: now)
        let month = calendar.component(.month, from: now)
        
        totalAmount = numbers.reduce(0) { $0 + ($1.type == .income ? $1.value : -$1.value) }
        
        annualAmount = numbers.filter {
            let numberYear = calendar.component(.year, from: $0.date)
            return numberYear == year
        }.reduce(0) { $0 + ($1.type == .income ? $1.value : -$1.value) }
        
        monthlyAmount = numbers.filter {
            let numberYear = calendar.component(.year, from: $0.date)
            let numberMonth = calendar.component(.month, from: $0.date)
            return numberYear == year && numberMonth == month
        }.reduce(0) { $0 + ($1.type == .income ? $1.value : -$1.value) }
    }
}
