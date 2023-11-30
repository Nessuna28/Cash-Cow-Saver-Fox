//
//  NavigationBar.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct NavigationBar: View {
    
    var body: some View {
        NavigationStack {
            HStack {
                Spacer()
                
                Spacer()
                
                ProfileNameAndImage()
                    .environmentObject(profileViewModel)
                    .environmentObject(childrenListViewModel)
                
                Spacer()
                
                AppIcon()
                
                SettingsButton()
                    .environmentObject(settingsViewModel)
                    .environmentObject(authViewModel)
                    .environmentObject(childrenListViewModel)
            }
            .padding()
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var childrenListViewModel: ChildrenListViewModel
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
}

#Preview {
    NavigationBar()
        .environmentObject(ProfileViewModel())
        .environmentObject(AuthViewModel())
        .environmentObject(EditViewModel())
        .environmentObject(ChildrenListViewModel())
        .environmentObject(SettingsViewModel())
}
