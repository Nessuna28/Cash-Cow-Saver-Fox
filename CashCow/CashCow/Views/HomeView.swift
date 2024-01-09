//
//  HomeView.swift
//  CashCow
//
//  Created by Angelique Freier on 28.11.23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    
                    ProfileNameAndImage()
                        .environmentObject(profileViewModel)
                        .environmentObject(childProfileViewModel)
                        
                    Spacer()
                    
                    AppIcon()
                }
                
                NavigatorView()
                    .environmentObject(settingsViewModel)
                    .environmentObject(authViewModel)
            }
            .environmentObject(childrenListViewModel)
            .padding(.horizontal)
            .onAppear {
                if let uid = AuthManager.shared.auth.currentUser?.uid {
                    FirebaseRepository.fetchUser(with: uid) { fireUser in
                        guard let fireUser else { return }
                        
                        profileViewModel.fireUser = fireUser
                        
                        profileViewModel.downloadPhoto(id: uid)
                    }
                }
                
                profileViewModel.profileImage = UIImage(named: Strings.defaultProfilePicture)
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    @StateObject private var childProfileViewModel = ChildProfileViewModel()
    @StateObject private var childrenListViewModel = ChildrenListViewModel()
    @StateObject private var settingsViewModel = SettingsViewModel()
    
}

#Preview {
    HomeView()
        .environmentObject(ProfileViewModel())
        .environmentObject(AuthViewModel())
        .environmentObject(ChildProfileViewModel())
        .environmentObject(ChildrenListViewModel())
        .environmentObject(SettingsViewModel())
}
