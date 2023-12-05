//
//  UnderlineTextFieldMain.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 23/11/23.
//

import SwiftUI

struct UnderlineTextFieldMain: View {
    
    enum SuccessType {
        case phoneNumber
        case verifyPhoneNumber
        case biasa
    }
    
    let placeholder: String
    @Binding var text: String
    
    let successType: SuccessType
    
    var body: some View {
        if successType == .phoneNumber {
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
                                .padding(.bottom, 5)
                                .autocorrectionDisabled()
                                .textCase(.lowercase)
                                .onChange(of: text) {
                                    if text.count > 13 {
                                        text = String(text.prefix(13))
                                    }
                                }
                            
                            
                            if !text.isEmpty {
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
        } else if successType == .verifyPhoneNumber {
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
                                .padding(.bottom, 5)
                                .autocorrectionDisabled()
                                .textCase(.lowercase)
                                .onChange(of: text) {
                                    if text.count > 5 {
                                        text = String(text.prefix(5))
                                    }
                                }
                            
                            
                            if !text.isEmpty {
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
        } else if successType == .biasa{
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
                                .padding(.bottom, 5)
                                .textCase(.lowercase)
                                .autocorrectionDisabled()
                            
                            
                            if !text.isEmpty {
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
        }
    }
}

#Preview {
    UnderlineTextFieldMain(placeholder: "", text: .constant("123456789"), successType: .phoneNumber)
}
