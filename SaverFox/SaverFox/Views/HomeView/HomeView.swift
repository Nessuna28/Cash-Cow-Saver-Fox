//
//  HomeView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    HStack {
                        Spacer()
                        
                        NavigationLink {
                            ProfileView()
                                .environmentObject(profileViewModel)
                        } label: {
                            ProfileNameAndImage()
                                .environmentObject(profileViewModel)
                        }
                        
                        AppIcon()
                            .padding(.leading, 30)
                            .padding(.trailing)
                        
                        NavigationLink {
                            SettingsView()
                                .environmentObject(authViewModel)
                                .environmentObject(settingsViewModel)
                        } label: {
                            Image(systemName: Strings.settingsIcon)
                                .font(.title2)
                        }
                    }
                    
                    Spacer()
                    
                    NavigatorView()
                        .padding(.top, 30)
                }
                .padding(.horizontal)
                
    //            CustomTabView()
    //                .padding(0)
            }
            
            if settingsViewModel.appLock && !biometryViewModel.authenticated {
                BiometryView()
                    .environmentObject(biometryViewModel)
                    .environmentObject(profileViewModel)
            }
        }
        
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    
    @StateObject private var settingsViewModel = SettingsViewModel()
    @StateObject private var biometryViewModel = BiometryViewModel()
    
}

#Preview {
    HomeView()
        .environmentObject(ProfileViewModel())
        .environmentObject(AuthViewModel())
}
