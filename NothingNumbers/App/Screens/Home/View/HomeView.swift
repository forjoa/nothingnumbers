//
//  HomeView.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import Foundation
import SwiftUI
import SwiftData

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @Query(sort: \Numbers.date, order: .reverse) private var numbers: [Numbers]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                GeometryReader { geometry in
                    let minY = geometry.frame(in: .global).minY
                    let isScrolled = minY < 0
                    
                    VStack {
                        HStack(alignment: .center) {
                            Image(systemName: "number")
                                .font(.system(size: 34, weight: .black))
                            
                            Text("Your numbers")
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
                                .offset(x: -100, y: -100)
                                .blur(radius: 50)
                        }
                    )
                    .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                    .offset(y: isScrolled ? -minY : 0)
                }
                .frame(height: 200)
                
                VStack(spacing: 20) {
                    AmountView(title: "Total Balance", amount: viewModel.totalAmount)
                    AmountView(title: "Annual Balance", amount: viewModel.annualAmount, fontSize: 40)
                    AmountView(title: "Monthly Balance", amount: viewModel.monthlyAmount, fontSize: 30)
                }
                .padding(.top, 40)
                
                VStack {
                    ForEach(numbers) { number in
                        TransactionRowView(number: number)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            Button {
                viewModel.isPresentingForm = true
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
            NumberFormView()
        }
        .onAppear {
            viewModel.calculateAmounts(for: numbers)
        }
        .onChange(of: numbers) { 
            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8)) {
                viewModel.calculateAmounts(for: numbers)
            }
        }
    }
}

struct AmountView: View {
    let title: String
    let amount: Double
    var fontSize: CGFloat = 50
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: fontSize - 10, weight: .bold))
                .foregroundColor(.gray)
            
            Text(String(format: "$%.2f", amount))
                .font(.system(size: fontSize, weight: .black))
                .foregroundColor(amount >= 0 ? .green : .red)
                .contentTransition(.numericText(countsDown: amount < 0))
        }
    }
}