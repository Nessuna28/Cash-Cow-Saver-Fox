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
            Section("Sicherheit") {
                Toggle(isOn: $settingsViewModel.appLock.animation()) {
                    Text("App sperren?")
                }
            }
            
            Section {
                Button(role: .destructive) {
                    authViewModel.logoutChild()
                } label: {
                    HStack {
                        Image(systemName: Strings.logoutIcon)
                        
                        Text(Strings.logout)
                    }
                }
            }
        }
        .navigationTitle("Einstellungen")
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var settingsViewModel: SettingsViewModel
    
}

#Preview {
    SettingsView()
        .environmentObject(AuthViewModel())
        .environmentObject(SettingsViewModel())
}
