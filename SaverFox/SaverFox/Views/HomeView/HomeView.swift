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
                                .environmentObject(profileViewModel)
                                .environmentObject(settingsViewModel)
                                .environmentObject(financeViewModel)
                                .environmentObject(savingViewModel)
                        } label: {
                            Image(systemName: Strings.settingsIcon)
                                .font(.title2)
                        }
                    }
                    
                    Spacer()
                    
                    Tabbar()
                        .environmentObject(profileViewModel)
                        .environmentObject(savingViewModel)
                        .environmentObject(financeViewModel)
                        .environmentObject(pointsViewModel)
                }
                .padding(.horizontal)
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
    @EnvironmentObject private var financeViewModel: FinanceViewModel
    
    @StateObject private var settingsViewModel = SettingsViewModel()
    @StateObject private var biometryViewModel = BiometryViewModel()
    @StateObject private var savingViewModel = SavingViewModel()
    @StateObject private var pointsViewModel = PointsViewModel()
    
}

#Preview {
    HomeView()
        .environmentObject(ProfileViewModel())
        .environmentObject(AuthViewModel())
        .environmentObject(FinanceViewModel())
        .environmentObject(SavingViewModel())
        .environmentObject(PointsViewModel())
}
