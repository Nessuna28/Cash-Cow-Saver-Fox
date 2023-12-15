//
//  ProfileNameAndImage.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct ProfileNameAndImage: View {
    
    var body: some View {
        HStack {
            Text(profileViewModel.child.firstName)
                .foregroundStyle(Colors.primaryOrange)
            
            if let image = profileViewModel.profilePicture {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Colors.secondaryOrange, lineWidth: 2))
                    .frame(width: 30)
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var profileViewModel: ProfileViewModel
}

#Preview {
    ProfileNameAndImage()
        .environmentObject(ProfileViewModel())
}
