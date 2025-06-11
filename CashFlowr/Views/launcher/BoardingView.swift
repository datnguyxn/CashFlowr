//
//  BoardingView.swift
//  CashFlowr
//
//  Created by Dat Nguyen on 1/6/25.
//

import SwiftUI

struct BoardingView: View {
    @State private var navigate: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Spacer()

                VStack(spacing: 8) {
                    Text("Cashflowr")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Track your finances with ease")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Image("Logo") // Replace with your actual image name in Assets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)

                Spacer()

                Button(action: {
                    navigate = true
                }) {
                    Text("Get Started")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.3))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer().frame(height: 24)
            }
            .padding()
            .navigationDestination(isPresented: $navigate) {
                SignInView()
            }
        }
        }
}

#Preview {
    BoardingView()
}
