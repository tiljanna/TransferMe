//
//  VerifyPhoneNumberView.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 23/11/23.
//

import SwiftUI

struct VerifyPhoneNumberView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var verifyCode = ""
    @State private var setVerify = false
    
    var body: some View {
        VStack {
            Text("Please add your mobile phone number")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(Color.gray)
                .frame(width: 165, height: 52)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Text("Enter Verification Code (5-digit)")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 33)
            
            UnderlineTextFieldMain(placeholder: "56234", text: $verifyCode, successType: .verifyPhoneNumber)
                .padding(.horizontal)
                .padding(.bottom)
                .padding(.bottom)
            
            Button {
                setVerify = true
            } label: {
                Text("Verify")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundStyle(Color.white)
                    .frame(width: 153, height: 59, alignment: .center)
                    .background(Color("hanBlue"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.top)
                    .padding(.top)
            }
            .navigationDestination(isPresented: $setVerify, destination: {
                SuccessfulView(successType: .verifyPhoneNumber)
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
        }
        .navigationTitle("Verify your Number")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    ToolBarButtonBack()
                }

            }
        }
    }
}

#Preview {
    VerifyPhoneNumberView()
}
