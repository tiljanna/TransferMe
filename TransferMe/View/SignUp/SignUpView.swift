//
//  SignUpView.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 10/11/23.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var emailAddress = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var loginView = false
    @State private var successRegsiter = false
    var body: some View {
        VStack {
            HStack {
                Image("logo")
                    .resizable()
                    .frame(width: 78, height: 47)
                    .padding()
                
                Spacer()
            }
            
            Text("Sign Up")
                .font(.system(size: 40, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            Text("Email Address")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(Color("labelTextField"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 24)
            
            UnderlineTextField(placeholder: "", text: $emailAddress, isSecure: false)
            
            Text("Password")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(Color("labelTextField"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 24)
            
            UnderlineTextField(placeholder: "", text: $password, isSecure: true)
            
            Text("Confirm Password")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(Color("labelTextField"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 24)
            
            UnderlineTextField(placeholder: "", text: $confirmPassword, isSecure: true)
            
            
            Button(action :{
                print(emailAddress)
                print(password)
                print(confirmPassword)
                successRegsiter = true
            }) {
                Text("Sign Up")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(Color.white)
                    .frame(width: 200, height: 60)
                    .background(Color("hanBlue"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.top, 50)
                    .shadow(color: Color("hanBlue"), radius: 5)
            }
            .navigationDestination(isPresented: $successRegsiter) {
                PhotoPicker()
            }
            
            HStack {
                Rectangle()
                    .frame(width: 79,height: 1)
                    .foregroundStyle(Color.gray)
                
                Text("or")
                    .foregroundStyle(Color.gray)
                
                Rectangle()
                    .frame(width: 79,height: 1)
                    .foregroundStyle(Color.gray)
            } // gambar divider --- or ---
            .padding(.top, 38)
            
            HStack(spacing: 43) {
                Button(action: {
                    print("Google")
                }) {
                    Image("google")
                }
                
                Button(action: {
                    print("Facebook")
                }) {
                    Image("facebook")
                }
            } // button gmail and facebook
            .padding(.top, 16)
            
            HStack(spacing: 2) {
                Text("Already have an account?")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color.gray)
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Login")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color("hanBlue"))
                }
                
            }
            .padding(.top, 44)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUpView()
}
