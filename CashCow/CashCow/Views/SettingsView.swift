//
//  SettingsView.swift
//  CashCow
//
//  Created by Angelique Freier on 30.11.23.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text(Strings.colorSettings)) {
                    ColorPicker(Strings.backgroundColor, selection: $settingsViewModel.backgroundColorFromPicker)
                    
                    ColorPicker(Strings.textColor, selection: $settingsViewModel.textColorFromPicker)
                }
                
                Section(header: Text(Strings.fontSize)) {
                    Picker("", selection: $settingsViewModel.settings.userFontSize) {
                        ForEach(settingsViewModel.fontSizes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text(Strings.darkMode)) {
                    Toggle(Strings.enableDarkMode, isOn: $settingsViewModel.settings.isDarkModeEnabled)
                }
                
                Section {
                    Button(Strings.resetSettings) {
                        settingsViewModel.resetSettings()
                    }
                }
                
                Section {
                    Button(Strings.save) {
                        settingsViewModel.saveSettings()
                        
                    }
                }
                
                Section {
                    Button(role: .destructive) {
                        authViewModel.logoutUser()
                        childrenListViewModel.removeListener()
                    } label: {
                        HStack {
                            Image(systemName: Strings.logoutIcon)
                            
                            Text(Strings.logout)
                        }
                    }
                }
            }
        }
        .navigationTitle(Strings.settings)
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var childrenListViewModel: ChildrenListViewModel
    
}


#Preview {
    SettingsView()
        .environmentObject(SettingsViewModel())
        .environmentObject(AuthViewModel())
        .environmentObject(ChildrenListViewModel())
}
