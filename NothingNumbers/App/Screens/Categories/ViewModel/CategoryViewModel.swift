//
//  CategoryViewModel.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import Foundation
import SwiftUI

class CategoryViewModel: ObservableObject {
    @Published var isPresentingForm: Bool = false
    
    func openForm() {
        isPresentingForm = true
    }
    
    func closeForm() {
        isPresentingForm = false
    }
}