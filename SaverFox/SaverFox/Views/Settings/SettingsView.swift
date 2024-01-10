//
//  SettingsView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        List {
            Section(Strings.security) {
                Toggle(isOn: $settingsViewModel.appLock.animation()) {
                    Text(Strings.lockApp)
                }
            }
            
            Section {
                Button(role: .destructive) {
                    logoutAndEmptyLoginData()
                } label: {
                    HStack {
                        Image(systemName: Strings.logoutIcon)
                        
                        Text(Strings.logout)
                    }
                }
            }
        }
        .navigationTitle(Strings.settings)
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    @EnvironmentObject private var settingsViewModel: SettingsViewModel
    @EnvironmentObject private var savingViewModel: SavingViewModel
    @EnvironmentObject private var financeViewModel: FinanceViewModel
    
    
    // MARK: - Functions
    
    private func logoutAndEmptyLoginData() {
        
        authViewModel.logoutChild()
        profileViewModel.emptyLoginData()
        savingViewModel.removeListener()
        financeViewModel.removeListener()
    }
    
}

#Preview {
    SettingsView()
        .environmentObject(AuthViewModel())
        .environmentObject(ProfileViewModel())
        .environmentObject(SettingsViewModel())
        .environmentObject(SavingViewModel())
        .environmentObject(FinanceViewModel())
}
