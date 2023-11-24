//
//  NavigationBar.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct NavigationBar: View {
    
    // MARK: - Variables
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    
    var body: some View {
        NavigationStack {
            HStack {
                Spacer()
                
                ProfileNameAndImage()
                    .environmentObject(profileViewModel)
                
                Spacer()
                
                AppIcon()
                
                SettingsButton()
            }
            .padding()
        }
    }
    
}

#Preview {
    NavigationBar()
        .environmentObject(ProfileViewModel())
}
