//
//  ProfileImage.swift
//  CashCow
//
//  Created by Angelique Freier on 22.11.23.
//

import SwiftUI
import PhotosUI

struct ProfileImage: View {
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                if let image = profileImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Colors.secondaryGray, lineWidth: 2))
                }

                PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                    Text(Strings.selectPhoto)
                }
            }
            
            Spacer()
        }
        .frame(height: 200)
        .onChange(of: selectedImage) { newImage in
            Task {
                if let imageData = try? await newImage?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: imageData) {
                        selectedProfileImage = uiImage
                        profileImage = uiImage
                    }
                }
            }
        }
    }
    
    
    // MARK: - Variables
    
    @Binding var profileImage: UIImage?
    @Binding var selectedProfileImage: UIImage?
    
    @State private var selectedImage: PhotosPickerItem?
    
}

#Preview {
    ProfileImage(profileImage: .constant(UIImage(named: Strings.defaultProfilePicture)), selectedProfileImage: .constant(UIImage()))
}
