//
//  SettingsButton.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct SettingsButton: View {
  
    var body: some View {
        NavigationLink {
            SettingsView()
                .environmentObject(settingsViewModel)
        } label: {
            Image(systemName: Strings.settingsIcon)
                .font(.title2)
                .padding(.leading)
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject var settingsViewModel: SettingsViewModel
}

#Preview {
    SettingsButton()
        .environmentObject(SettingsViewModel())
}
