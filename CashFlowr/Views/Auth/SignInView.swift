//
//  SignInView.swift
//  CashFlowr
//
//  Created by Dat Nguyen on 1/6/25.
//

import SwiftUI

struct SignInView: View {
        @State private var username: String = ""
        @State private var password: String = ""
        @State private var rememberMe: Bool = false
        
        var body: some View {
            NavigationStack {
                VStack(spacing: 32) {
                    VStack(spacing: 8) {
                        Text("Cashflowr")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    
                    VStack(spacing: 16) {
                        TextField("Username", text: $username)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(12)
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(12)
                        
                        HStack {
                            Toggle(isOn: $rememberMe) {
                                Text("Remember Me")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .toggleStyle(CheckboxToggleStyle())
                            .padding(.leading, 4)
                            
                            Spacer()
                            
                            NavigationLink(destination: ForgotPasswordView())
                            {
                                Text("Forgot Password?")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Sign-in logic here
                        }) {
                            Text("Sign In")
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
                        Text("Don't have an account?")
                            .foregroundColor(.gray)
                        // Navigate to Sign Up
                        NavigationLink(destination: SignUpView())
                        {
                            Text("Sign Up")
                                .foregroundColor(Color.blue.opacity(0.4))
                        }
                    }
                    .font(.footnote)
                }
                .padding()
            }
        }
    }
    
    struct CheckboxToggleStyle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button(action: {
                configuration.isOn.toggle()
            }) {
                HStack {
                    Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    configuration.label
                }
            }
            .buttonStyle(.plain)
        }
    
}

#Preview {
    SignInView()
}
