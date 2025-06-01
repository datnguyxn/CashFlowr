//
//  LaunchView.swift
//  CashFlowr
//
//  Created by Dat Nguyen on 1/6/25.
//

import SwiftUI

struct LaunchView: View {
    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                SplashView()
                    .transition(.scale)
            } else {
//                HomeView()
                SignInView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.6), value: showSplash)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }
}

#Preview {
    LaunchView()
}
