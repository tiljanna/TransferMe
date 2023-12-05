//
//  AddPhoneNumberView.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 23/11/23.
//

import SwiftUI

struct AddPhoneNumberView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var numberPhone = ""
    @State private var setNumber = false
    var body: some View {
        VStack {
            Text("Please add your mobile phone number")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(Color.gray)
                .frame(width: 165, height: 52)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Text("* Phone Number")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 33)
            
            UnderlineTextFieldMain(placeholder: "085163612405", text: $numberPhone, successType: .phoneNumber)
                .padding(.horizontal)
                .padding(.bottom)
                .padding(.bottom)
            
            Button {
                setNumber = true
            } label: {
                Text("Confirm")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundStyle(Color.white)
                    .frame(width: 199, height: 59, alignment: .center)
                    .background(Color("hanBlue"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.top)
                    .padding(.top)
            }
            .navigationDestination(isPresented: $setNumber, destination: {
                VerifyPhoneNumberView()
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
        }
        .navigationTitle("Phone Number")
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
    AddPhoneNumberView()
}
