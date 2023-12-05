//
//  ToolBarButtonBack.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 02/12/23.
//

import SwiftUI

struct ToolBarButtonBack: View {
    var body: some View {
        ZStack {
            Color("hanBlue")
            
            VStack {
                Image(systemName: "arrow.left")
                    .foregroundStyle(Color.white)
                    .padding()
            }
            .frame(width: 64, height: 34)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ToolBarButtonBack()
}
