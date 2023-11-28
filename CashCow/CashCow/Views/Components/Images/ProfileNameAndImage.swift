//
//  ProfileNameAndImage.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct ProfileNameAndImage: View {
    
    
    // MARK: - Variables
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        HStack {
            NavigationLink {
                if let user = profileViewModel.fireUser {
                    ProfileView(fireUser: user)
                        .environmentObject(profileViewModel)
                }
            } label: {
                Text(profileViewModel.fireUser?.firstName ?? Strings.guest)
                    .foregroundColor(Colors.primaryColor)
                    .padding(.trailing, 5)
                
                Image(systemName: Strings.profileIconSystem)
                    .font(.title2)
            }
        }
    }
    
}

#Preview {
    ProfileNameAndImage()
        .environmentObject(ProfileViewModel())
}
