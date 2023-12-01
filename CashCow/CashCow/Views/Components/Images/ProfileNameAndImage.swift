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
                
                Image(systemName: Strings.profileIconSystem)
                    .font(.title2)
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var childProfileViewModel: ChildProfileViewModel
    @EnvironmentObject var childrenListViewModel: ChildrenListViewModel
    
}

#Preview {
    ProfileNameAndImage()
        .environmentObject(ProfileViewModel())
        .environmentObject(ChildProfileViewModel())
        .environmentObject(ChildrenListViewModel())
}
