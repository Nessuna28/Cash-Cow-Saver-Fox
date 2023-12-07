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
            Image(Strings.adultWoman)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .frame(width: 100, height: 100)
            
            Spacer()
            
            PhotosPicker(selection: 
                $profileImage,
                matching: .images, photoLibrary:
                .shared()) {
                Text("Foto auswählen")
            }
        }
        .frame(height: 100)
    }
    
    
    // MARK: - Functions
    
    @Binding var profileImage: PhotosPickerItem?
}

#Preview {
    ProfileImage(profileImage: .constant(<#T##value: PhotosPickerItem?##PhotosPickerItem?#>))
}
