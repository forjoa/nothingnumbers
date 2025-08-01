//
//  NumberFormView.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import SwiftUI
import SwiftData

struct NumberFormView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = NumberFormViewModel()
    @Query private var categories: [Category]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Transaction Details")) {
                    TextField("Amount", text: $viewModel.value)
                        .keyboardType(.decimalPad)
                    TextField("Note", text: $viewModel.note)
                    Picker("Type", selection: $viewModel.type) {
                        Text("Income").tag(NumbersType.income)
                        Text("Expense").tag(NumbersType.expense)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    if viewModel.type == .expense {
                        Picker("Category", selection: $viewModel.selectedCategory) {
                            ForEach(categories) { category in
                                Text(category.name).tag(category as Category?)
                            }
                        }
                    }
                }
            }
            .navigationTitle("New Transaction")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.saveNumber(in: modelContext)
                        dismiss()
                    }
                }
            }
        }
    }
}