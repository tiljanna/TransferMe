//
//  PhotoPicker.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 15/11/23.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: View {
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    @State private var firstName = ""
    @State private var lastName = ""
    
    @State private var setProfile = false
    
    var body: some View {
        VStack {
            Text("Please set up your profile")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(Color.gray)
                .padding()
            
            Spacer()
            
            PhotosPicker(selection: $avatarItem, matching: .images) {
                ZStack {
                    if let avatarImage {
                       avatarImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 134, height: 134)
                            .clipShape(Circle())
                    } else {
                        Circle()
                            .foregroundStyle(Color("hanBlue"))
                            .frame(width: 134, height: 134)
                    }
                    
                    VStack {
                        if avatarImage == nil {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color.white)
                        }
                    }
                }
            }
            .onChange(of: avatarItem) {
                Task {
                    if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            avatarImage = Image(uiImage: uiImage)
                            print(data)
                            return
                        }
                    }
                }
            }
            
            Spacer()
            
            Text("First Name")
                .foregroundStyle(Color("hanBlue"))
                .font(.system(size: 13, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 33)
            
            UnderlineTextFieldMain(placeholder: "", text: $firstName, successType: .biasa)
                .padding(.horizontal)
                .padding(.bottom)
            
            Text("Last Name")
                .foregroundStyle(Color("hanBlue"))
                .font(.system(size: 13, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 33)
            
            UnderlineTextFieldMain(placeholder: "", text: $lastName, successType: .biasa)
                .padding(.horizontal)
                .padding(.bottom)
            
            Button {
                setProfile = true
            } label: {
                Text("Set")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundStyle(Color.white)
                    .frame(width: 133, height: 59, alignment: .center)
                    .background(Color("hanBlue"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.top)
            }
            .navigationDestination(isPresented: $setProfile, destination: {
                AddPhoneNumberView()
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PhotoPicker()
}
