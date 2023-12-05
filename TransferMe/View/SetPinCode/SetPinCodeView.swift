//
//  SetPinCodeView.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 23/11/23.
//

import SwiftUI
import Combine

struct SetPinCodeView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var pinCode = ""
    @State private var setPinCode = false
    
    @State private var showError = false
    var body: some View {
        ZStack(alignment: .bottom) {
            if showError {
                Text("Complete the pin Code")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
                            withAnimation {
                                if showError {
                                    showError = false
                                }
                            }
                        }
                    }
            }
            VStack {
                Text("Please set your own Pin Code")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.gray)
                    .frame(width: 149, height: 52)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
                Spacer()
                
                Text("Set Pin Code (5-digit)")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(Color.gray)
                    .padding(.vertical)
                
                HStack {
                    ForEach(0..<5) { index in
                        if index < pinCode.count {
                            if pinCode.count < 5 {
                                Circle()
                                    .fill(Color("hanBlue"))
                                    .stroke(.red.opacity(0.5), lineWidth: 2)
                                    .frame(width: 20, height: 20)
                            } else {
                                Circle()
                                    .fill(Color("hanBlue"))
                                    .frame(width: 20, height: 20)
                            }
                        } else {
                            Circle()
                                .stroke(.gray, lineWidth: 2)
                                .fill(Color.clear)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .padding(.bottom)
                
                NumberPad(pinCode: $pinCode)
                    .padding(.top)
                
                Button {
                    if pinCode.count == 5 {
                        setPinCode = true
                        print("Set Pin Code \(pinCode) Successfully, Move roat to HomeView.")
                    } else {
                        showError = true
                    }
                } label: {
                    Text("Set")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundStyle(Color.white)
                        .frame(width: 117, height: 59, alignment: .center)
                        .background(Color("hanBlue"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.top)
                        .padding(.top)
                }
                .navigationDestination(isPresented: $setPinCode, destination: {
                    SuccessfulView(successType: .setPincode)
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
            }
            .navigationTitle("Set Pin Code")
            .navigationBarTitleDisplayMode(.inline)
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
}

#Preview {
    SetPinCodeView()
}
