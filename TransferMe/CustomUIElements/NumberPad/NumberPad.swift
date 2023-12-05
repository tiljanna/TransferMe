//
//  NumberPad.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 23/11/23.
//

import SwiftUI

struct NumberPad: View {
    let columns = [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))]
    let numberPad = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"]
    @Binding var pinCode: String // Add a binding for pinCode
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(numberPad, id: \.self) { number in
                Button(action: {
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    if number != "*" && number != "#" {
                        pinCode.append(number)
                        if pinCode.count > 5 {
                            pinCode = String(pinCode.prefix(5))
                        }
                    } else {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        if number == "*" {
                            if pinCode.count > 0 {
                                pinCode.removeLast()
                            }
                        } else if number == "#" {
                            print("This is Using TouchID")
                        }
                    }
                }) {
                    if number == "*" {
                        Image(systemName: "delete.left")
                            .font(.system(size: 22))
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } else if number == "#" {
                        Image(systemName: "faceid")
                            .font(.system(size: 22))
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } else {
                        Text("\(number)")
                            .font(.system(size: 20, weight: .medium))
                            .frame(width: 58, height: 58)
                            .foregroundColor(.white)
                            .background(Color("hanBlue"))
                            .clipShape(Circle())
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    NumberPad(pinCode: .constant("19384"))
}
