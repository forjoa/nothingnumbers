//
//  CategoryFormView.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import SwiftUI

struct CategoryFormView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = CategoryFormViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $viewModel.name)
                TextField("Color Hex", text: $viewModel.colorHex)
            }
            .navigationTitle("New Category")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.saveCategory(in: modelContext)
                        dismiss()
                    }
                }
            }
        }
    }
}