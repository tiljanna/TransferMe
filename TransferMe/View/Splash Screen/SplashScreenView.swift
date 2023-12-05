//
//  SplashScreenView.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 09/11/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isPresentedOnBoardingView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .fill(Color("hanBlue"))
                        .frame(width: 80, height: 80)
                        .offset(x: -25)
                    
                    Circle()
                        .fill(Color("skyBlue"))
                        .frame(width: 80, height: 80)
                        .offset(x: 25)
                }
                
                Text("TransferMe")
                    .font(.system(size: 54, weight: .semibold))
                    .foregroundStyle(Color("hanBlue"))
                
                Text("Your Best Money Transfer Partner.")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(Color("hanBlue"))
                
                Spacer()
                
                HStack(spacing: 0){
                    Text("Secured by")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(Color.gray)
                    
                    Text("TransferMe.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(Color("hanBlue"))
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    // Change the root view to OnBoardingView
                    let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }
                    window?.rootViewController = UIHostingController(rootView: OnBoardingView())
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
