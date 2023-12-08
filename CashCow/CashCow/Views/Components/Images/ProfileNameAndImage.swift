//
//  ProfileNameAndImage.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct ProfileNameAndImage: View {
    
    var body: some View {
        HStack {
            NavigationLink {
                if let user = profileViewModel.fireUser {
                    ProfileView(fireUser: user)
                        .environmentObject(profileViewModel)
                        .environmentObject(childProfileViewModel)
                        .environmentObject(childrenListViewModel)
                }
            } label: {
                Text(profileViewModel.fireUser?.firstName ?? Strings.guest)
                    .foregroundColor(Colors.primaryGreen)
                    .padding(.trailing, 5)
                
                if let image = profileViewModel.profileImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Colors.secondaryGray, lineWidth: 2))
                        .frame(width: 30)
                }
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    @EnvironmentObject private var childProfileViewModel: ChildProfileViewModel
    @EnvironmentObject private var childrenListViewModel: ChildrenListViewModel
    
}

#Preview {
    ProfileNameAndImage()
        .environmentObject(ProfileViewModel())
        .environmentObject(ChildProfileViewModel())
        .environmentObject(ChildrenListViewModel())
}
