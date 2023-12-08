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
