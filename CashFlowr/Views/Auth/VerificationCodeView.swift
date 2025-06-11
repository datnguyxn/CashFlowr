//
//  VerificationCodeView.swift
//  CashFlowr
//
//  Created by Dat Nguyen on 3/6/25.
//

import SwiftUI

struct VerificationCodeView: View {
    @State private var code: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?
    
    @State private var minutes = 1
    @State private var seconds = 0
    @State private var timerActive = true
    @State private var isFirstTimeResend = false
    @State private var navigate = false
    @State private var isLoading = false
        
    let email: String
    
       var body: some View {
           NavigationStack {
               ZStack(alignment: .center) {
                   VStack(spacing: 24) {
                       // Title
                       Text("Enter OTP code")
                           .font(.title2)
                           .bold()

                       // Description
                       (
                           Text("Please enter the 6-digit code we sent to your email: ")
                           + Text(email)
                               .foregroundColor(.blue)
                               .bold()
                       )
                       .multilineTextAlignment(.center)
                       .font(.subheadline)
                       .padding(.horizontal)

                       // Code Boxes
                       HStack(spacing: 12) {
                           ForEach(0..<6, id: \.self) { index in
                               TextField("", text: $code[index])
                                   .keyboardType(.numberPad)
                                   .frame(width: 48, height: 48)
                                   .multilineTextAlignment(.center)
                                   .background(Color.gray.opacity(0.1))
                                   .cornerRadius(8)
                                   .focused($focusedField, equals: index)
                                   .onChange(of: code[index]) { oldValue, newValue in
                                       if newValue.count == 1 {
                                           if index < 5 { focusedField = index + 1 }
                                       } else if newValue.count > 1 {
                                           code[index] = String(newValue.prefix(1))
                                       }
                                   }
                           }
                       }

                       // Countdown
                       HStack(spacing: 40) {
                           VStack {
                               Text(String(format: "%02d", minutes))
                                   .font(.title2)
                                   .bold()
                               Text("Minutes")
                                   .font(.caption)
                           }
                           VStack {
                               Text(String(format: "%02d", seconds))
                                   .font(.title2)
                                   .bold()
                               Text("Seconds")
                                   .font(.caption)
                           }
                       }

                       // Verify Button
                       Button(action: {
                           verifyCode()
                       }) {
                           Text("Verify")
                               .frame(maxWidth: .infinity)
                               .padding()
                               .background(Color.blue.opacity(0.3))
                               .foregroundColor(.black)
                               .cornerRadius(12)
                       }
                       .padding(.top)

                       // Resend Section
                       if (minutes == 0 && seconds <= 30 || isFirstTimeResend) {
                           VStack(spacing: 4) {
                               Text("Didn't receive the code?")
                                   .font(.footnote)
                                   .foregroundColor(.gray)
                               
                               Button("Resend code", action: resendCode)
                                   .font(.footnote)
                           }
                       }

                       Spacer()
                   }
                   .padding()

                   if isLoading {
                       ZStack {
                           Color.gray.opacity(0.5)
                               .ignoresSafeArea()
                           ProgressView()
                               .progressViewStyle(CircularProgressViewStyle())
                               .scaleEffect(1.5)
                       }
                   }
               }
               .onAppear {
                   startTimer()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                       isLoading = false
                   }
               }
               .navigationDestination(isPresented: $navigate) {
                   ForgotPasswordView()
               }
           }
       }

       // Timer logic
       func startTimer() {
           Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
               if seconds > 0 {
                   seconds -= 1
               } else if minutes > 0 {
                   minutes -= 1
                   seconds = 59
               } else {
                   timer.invalidate()
                   timerActive = false
               }
           }
       }

       func verifyCode() {
           print("Entered code: \(code.joined())")
           isLoading = true

           // Simulate an async verification process
           DispatchQueue.global().async {
               sleep(2) // Simulate network delay

               DispatchQueue.main.async {
                   isLoading = false
                   navigate = true
               }
           }
       }

       func resendCode() {
           print("Resend code tapped")
           // Reset timer and logic here
           minutes = 1
           seconds = 0
           startTimer()
           isFirstTimeResend = true
       }
   }
#Preview {
    VerificationCodeView(email: "nguyentrongdat1108@gmail.com")
}
