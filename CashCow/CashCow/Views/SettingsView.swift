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
                Section(header: Text("Farbeinstellungen")) {
                    ColorPicker("Hintergrundfarbe", selection: $settingsViewModel.settings.backgroundColor)
                    
                    ColorPicker("Textfarbe", selection: $settingsViewModel.settings.textColor)
                }
                
                Section(header: Text("Textgröße")) {
                    Picker("Schriftgröße", selection: $settingsViewModel.settings.userFontSize) {
                        ForEach(settingsViewModel.fontSizes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Dark Mode")) {
                    Toggle("Dark Mode aktivieren", isOn: $settingsViewModel.settings.isDarkModeEnabled)
                }
                
                Section {
                    Button("Speichern") {
                        setSettings()
                    }
                }
                
                Section {
                    Button("Logout", role: .destructive) {
                        authViewModel.logoutUser()
                        childrenListViewModel.removeListener()
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
    
    
    // MARK: - Functions
    
    private func setSettings() {
        
        settingsViewModel.saveSettings()
    }
}

#Preview {
    SettingsView()
        .environmentObject(SettingsViewModel())
        .environmentObject(AuthViewModel())
        .environmentObject(ChildrenListViewModel())
}
