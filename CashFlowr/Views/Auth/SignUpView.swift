//
//  SignUpView.swift
//  CashFlowr
//
//  Created by Dat Nguyen on 1/6/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                VStack(spacing: 8) {
                    Text("Cashflowr")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                VStack(spacing: 16) {
                    TextField("User name", text: $username)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                        .autocapitalization(.none)
                    
                    TextField("First name", text: $firstName)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                        .autocapitalization(.none)
                    
                    TextField("Last name", text: $lastName)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                        .autocapitalization(.none)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                        .autocapitalization(.none)
                    
                    ZStack(alignment: .trailing) {
                        Group {
                            if isPasswordVisible {
                                TextField("Password", text: $password)
                            } else {
                                SecureField("Password", text: $password)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                        .autocapitalization(.none)

                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                    
                    ZStack(alignment: .trailing) {
                        Group {
                            if isPasswordVisible {
                                TextField("Confirm Password", text: $confirmPassword)
                            } else {
                                SecureField("Confirm Password", text: $confirmPassword)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                        .autocapitalization(.none)

                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                    
                    
                    Spacer()
                    
                    Button(action: {
                        // Sign-in logic here
                    }) {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.4))
                            .foregroundColor(.black)
                            .cornerRadius(12)
                    }
                }
                
                Spacer()
                
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                    // Navigate to Sign Up
                    NavigationLink(destination: SignInView())
                    {
                        Text("Sign In")
                            .foregroundColor(Color.blue.opacity(0.4))
                    }
                }
                .font(.footnote)
            }
            .padding()
        }
    }
}

#Preview {
    SignUpView()
}
