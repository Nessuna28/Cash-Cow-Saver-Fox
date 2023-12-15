//
//  HomeView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        ProfileView()
                    } label: {
                        ProfileNameAndImage()
                            .environmentObject(profileViewModel)
                    }
                    
                    Spacer()
                    
                    AppIcon()
                        .padding(.trailing)
                    
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: Strings.settingsIcon)
                            .font(.title2)
                    }
                }
                
                Spacer()
                
                OverviewView()
                    .padding(.top, 50)
            }
        }
        .padding(.horizontal)
    }
    
    
    // MARK: - Variables
    
    @StateObject private var profileViewModel = ProfileViewModel()
    @StateObject private var settingsViewModel = SettingsViewModel()
    
}

#Preview {
    HomeView()
}
