//
//  LoginView.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 16/11/23.
//

import SwiftUI

struct LoginView: View {
    @State private var emailAddress = ""
    @State private var password = ""
    
    @State private var signUpView = false
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 78, height: 47)
                        .padding()
                    
                    Spacer()
                }
                
                Text("Log In")
                    .font(.system(size: 40, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Spacer()
                
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
                
                Spacer()
                
                Button(action :{
                    print(emailAddress)
                    print(password)
                }) {
                    Text("Log In")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundStyle(Color.white)
                        .frame(width: 200, height: 60)
                        .background(Color("hanBlue"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.top, 50)
                        .shadow(color: Color("hanBlue"), radius: 5)
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
                    Text("Don’t have an account?")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color.gray)
                    
                    Button(action: {
                        signUpView = true
                    }) {
                        Text("Sign Up")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color("hanBlue"))
                    }
                    .navigationDestination(isPresented: $signUpView) {
                        SignUpView()
                    }
                }
                .padding(.top, 60)
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    LoginView()
}
