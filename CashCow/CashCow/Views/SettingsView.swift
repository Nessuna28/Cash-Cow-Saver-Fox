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
            List {
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
                        settingsViewModel.updateSettings()
                        
                        settingsViewModel.showAlert.toggle()
                    }
                }
                
                Section(Strings.account) {
                    Button(role: .destructive) {
                        authViewModel.logoutUser()
                        childrenListViewModel.removeListener()
                        choiceOptionViewModel.removeListener()
                    } label: {
                        HStack {
                            Image(systemName: Strings.logoutIcon)
                            
                            Text(Strings.logout)
                        }
                    }
                    
                    Button(role: .destructive) {
                        childrenListViewModel.removeListener()
                        choiceOptionViewModel.removeListener()
                        AuthManager.shared.deleteUser()
                        authViewModel.logoutUser()
                        
                    } label: {
                        HStack {
                            Image(systemName: Strings.deleteIcon)
                            
                            Text(Strings.deleteAccount)
                        }
                    }
                }
            }
            .alert(Strings.settingsSaved, isPresented: $settingsViewModel.showAlert) {
                Button(Strings.okay, role: .cancel) { }
            }
        }
        .navigationTitle(Tab.settings.title)
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var settingsViewModel: SettingsViewModel
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var childrenListViewModel: ChildrenListViewModel
    @EnvironmentObject private var choiceOptionViewModel: ChoiceOptionViewModel
    
}


#Preview {
    SettingsView()
        .environmentObject(SettingsViewModel())
        .environmentObject(AuthViewModel())
        .environmentObject(ChildrenListViewModel())
        .environmentObject(ChoiceOptionViewModel())
}
