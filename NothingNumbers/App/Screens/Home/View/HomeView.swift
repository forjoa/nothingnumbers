//
//  HomeView.swift
//  NothingNumbers
//
//  Created by Joaquín Trujillo on 1/8/25.
//
import Foundation
import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = 10.0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack(alignment: .center) {
                    Image(systemName: "number")
                        .font(.system(size: 34, weight: .black))
                        .foregroundColor(.white)
                    
                    Text("Your numbers")
                        .font(.system(size: 34, weight: .black))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(height: 50)
                .padding(.horizontal)
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .background(Color("NothingPrimary"))
            .clipShape(
                RoundedCorner(radius: 40, corners: [.bottomLeft, .bottomRight])
            )
            

            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}
