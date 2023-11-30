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
                        .environmentObject(childrenListViewModel)
                    
                    Spacer()
                    
                    AppIcon()
                }
                
                Text(Strings.setUpFinances)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
                    .padding(.top, 30)
                
                NavigatorView()
                    .environmentObject(settingsViewModel)
            }
            .padding(.horizontal)
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject var childrenListViewModel = ChildrenListViewModel()
    @StateObject var settingsViewModel = SettingsViewModel()
    
}

#Preview {
    HomeView()
        .environmentObject(ProfileViewModel())
        .environmentObject(AuthViewModel())
        .environmentObject(ChildrenListViewModel())
        .environmentObject(SettingsViewModel())
}
