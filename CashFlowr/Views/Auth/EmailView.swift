//
//  EmailView.swift
//  CashFlowr
//
//  Created by Dat Nguyen on 3/6/25.
//

import SwiftUI

struct EmailView: View {
    let title: String
    let description: String
    @State private var isPresented: Bool = false
    @State private var email: String = ""
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                VStack(spacing: 8) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                VStack(spacing: 16) {
                    Text("Enter your email address")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    if !description.isEmpty {
                            Text(description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }

                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    Button(action: {
                        sendMail()
                        navigate = true
                    }) {
                        Text("Submit")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.4))
                            .foregroundColor(.black)
                            .cornerRadius(12)
                    }
                    
                    Spacer()
                    
                }
            }
            .padding()
            .navigationDestination(isPresented: $navigate) {
                VerificationCodeView(email: email)
            }
        }
    }
    
    private func sendMail() {
        // Replace this with actual mail-sending logic
        print("Sending reset link to: \(email)")
    }
}

#Preview {
    EmailView(title: "String", description: "")
}
