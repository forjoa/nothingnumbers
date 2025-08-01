
//
//  TransactionRowView.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import SwiftUI

struct TransactionRowView: View {
    let number: Numbers

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(number.note ?? "N/A")
                    .font(.headline)
                if let category = number.category {
                    Text(category.name)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            Text(String(format: "$%.2f", number.value))
                .font(.headline)
                .foregroundColor(number.type == .income ? .green : .red)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
