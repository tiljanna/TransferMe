//
//  PhotoPickerView.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 14/11/23.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    @State private var avatarItem = [PhotosPickerItem]()
    @State private var avatarImage = [Image]()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<avatarImage.count, id: \.self) { index in
                        avatarImage[index]
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                    }
                }
            }
            .toolbar {
                PhotosPicker("Select image", selection: $avatarItem, matching: .images)
            }
        }
        .onChange(of: avatarItem) {
            Task {
                avatarImage.removeAll()
                
                for item in avatarItem {
                    if let data = try? await item.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            let image = Image(uiImage: uiImage)
                            avatarImage.append(image)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PhotoPickerView()
}
