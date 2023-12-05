//
//  UnderlineTextField.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 11/11/23.
//

import SwiftUI

struct UnderlineTextField: View {
    let placeholder: String
    @Binding var text: String
    @State var isSecure: Bool?
    @State private var showPassword: Bool = false
    @State var isEmail: Bool?
    
    var body: some View {
        if isSecure ?? false {
            HStack {
                VStack {
                    ZStack(alignment: .leading) {
                        if text.isEmpty {
                            Text(placeholder)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundStyle(Color.gray.opacity(0.6))
                        }
                        HStack {
                            if showPassword {
                                TextField("", text: $text)
                                    .foregroundStyle(Color.black)
                                    .autocorrectionDisabled()
                            } else {
                                SecureField("", text: $text)
                                    .foregroundStyle(Color.black)
                                    .autocorrectionDisabled()
                            }
                            
                            
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(systemName: showPassword ? "eye.slash.fill" : "eye")
                                    .foregroundStyle(Color.black.opacity(0.5))
                                    .font(.system(size: 12))
                            }
                        }
                    }
                    .padding(.top)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(Color.gray.opacity(0.7))
                }
                .padding(.horizontal)
            }
        } else {
            HStack {
                VStack {
                    ZStack(alignment: .leading) {
                        if text.isEmpty {
                            Text(placeholder)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundStyle(Color.gray.opacity(0.7))
                        }
                        HStack {
                            TextField("", text: $text)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundStyle(Color.black)
                                .textCase(.lowercase)
                                .padding(.bottom, 5)
                                .autocorrectionDisabled()
                            
                            
                            if isValidEmail {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 18))
                                    .foregroundStyle(Color("hanBlue"))
                                    .padding(.bottom, 5)
                            }
                        }
                    }
                    .padding(.top)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(Color.gray.opacity(0.7))
                }
                .padding(.horizontal)
            }
            .onChange(of: text) {
                text = text.lowercased()
            }
        }
    }
}

extension UnderlineTextField {
    private var isValidEmail: Bool {
        let emailRegex = "^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: text)
    }
}

#Preview {
    UnderlineTextField(placeholder: "Email Address", text: .constant("pututyb@gmail.com"), isSecure: false)
}
