//
//  HomeView.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 29/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var saldo: Double = 285856.20
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Current Balance")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Text(saldo, format: .currency(code: "USD"))
                    .font(.system(size: 35, weight: .bold))
                    .foregroundStyle(Color("hanBlue"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<5) { index in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 2)
                                    .frame(width: 310, height: 80)
                                    .padding()
                                
                                HStack {
                                    Text("VL")
                                        .padding()
                                    
                                    VStack(alignment: .leading) {
                                        Text("VISA")
                                            .foregroundStyle(Color.gray)
                                            .font(.system(size: 12, weight: .medium))
                                        
                                        Text("Master Card 6253")
                                            .foregroundStyle(Color.gray)
                                            .font(.system(size: 12, weight: .medium))
                                    }
                                    
                                    Text(saldo, format: .currency(code: "USD"))
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundStyle(Color("hanBlue"))
                                        .padding(.leading)
                                }
                            }
                        }
                    }
                }
                
                HStack {
                    Text("Incoming Transactions")
                        .foregroundStyle(Color.gray)
                        .font(.system(size: 18, weight: .medium))
                    
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        HStack {
                            Text("See All")
                                .font(.system(size: 14, weight: .regular))
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14))
                        }
                    }

                }
                .padding()
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("Notification")
                    }, label: {
                        Image(systemName: "bell")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(Color.black)
                    })
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
