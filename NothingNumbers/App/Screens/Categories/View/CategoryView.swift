
//
//  CategoryView.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import SwiftUI
import SwiftData

struct CategoryView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = CategoryViewModel()
    @Query(sort: \Category.name) private var categories: [Category]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                GeometryReader { geometry in
                    let minY = geometry.frame(in: .global).minY
                    let isScrolled = minY < 0
                    
                    VStack {
                        HStack(alignment: .center) {
                            Image(systemName: "list.clipboard")
                                .font(.system(size: 34, weight: .black))
                            
                            Text("Your categories")
                                .font(.system(size: 34, weight: .black))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                        .padding(.horizontal)
                        .padding(.top, 50)
                    }
                    .frame(
                        width: geometry.size.width,
                        height: 200 + (isScrolled ? minY : 0)
                    )
                    .background(
                        ZStack {
                            LinearGradient(
                                gradient: Gradient(colors: [Color("NothingPrimary").opacity(0.7), Color("NothingPrimary"), .black]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            Circle()
                                .fill(Color.white.opacity(0.1))
                                .frame(width: 300, height: 300)
                                .offset(x: 100, y: -100)
                                .blur(radius: 50)
                        }
                    )
                    .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                    .offset(y: isScrolled ? -minY : 0)
                }
                .frame(height: 200)
                
                VStack {
                    ForEach(categories) { category in
                        HStack {
                            Circle()
                                .fill(Color(hex: category.colorHex))
                                .frame(width: 10, height: 10)
                            Text(category.name)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                    }
                    .onDelete(perform: deleteCategory)
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            Button {
                viewModel.openForm()
            } label: {
                Image(systemName: "plus")
                    .font(.title.weight(.semibold))
                    .padding()
                    .background(Color("NothingPrimary"))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 10)
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isPresentingForm) {
            CategoryFormView()
        }
    }
    
    private func deleteCategory(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(categories[index])
            }
        }
    }
}
