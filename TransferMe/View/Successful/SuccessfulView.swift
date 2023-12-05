//
//  SuccessfulView.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 27/11/23.
//

import SwiftUI

struct SuccessfulView: View {
    enum SuccessType {
        case verifyPhoneNumber
        case setPincode
    }
    
    let successType: SuccessType
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("checklist")
                
                Text("Congrats!")
                    .font(.system(size: 55, weight: .bold))
                    .foregroundStyle(Color("hanBlue"))
                
                Text(successMessage)
                    .frame(width: 300, height: 42)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color("hanBlue"))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                if successType == .verifyPhoneNumber {
                    NavigationLink {
                        SetPinCodeView()
                    } label: {
                        Text("Great!")
                            .font(.system(size: 22, weight: .medium))
                            .foregroundStyle(Color.white)
                            .frame(width: 153, height: 60)
                            .background(Color("hanBlue"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                } else {
                    Button(action: {
                        withAnimation {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                // Change the root view to OnBoardingView
                                let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }
                                window?.rootViewController = UIHostingController(rootView: HomeView())
                            }
                        }
                    }, label: {
                        Text("Great!")
                            .font(.system(size: 22, weight: .medium))
                            .foregroundStyle(Color.white)
                            .frame(width: 153, height: 60)
                            .background(Color("hanBlue"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    })
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var successMessage: String {
        switch successType {
        case.verifyPhoneNumber:
            return "Verification has been done Successfully"
        case.setPincode:
            return "Account Registed Successfully"
        }
    }
}

#Preview {
    SuccessfulView(successType: .setPincode)
}
