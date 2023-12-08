//
//  NavigatorView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct NavigatorView: View {
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                ForEach(Tab.allCases) { tab in
                    tab.view
                        .environmentObject(settingsViewModel)
                        .environmentObject(authViewModel)
                        .environmentObject(childrenListViewModel)
                        .tabItem {
                            VStack {
                                tab.icon
                                
                                Text(tab.title)
                            }
                            .foregroundColor(settingsViewModel.subtitleColor)
                        }
                        .tag(tab)
                }
            }
        }
    }
    
    // MARK: - Variables
    
    @State private var selectedTab: Tab = .home
    
    @EnvironmentObject private var settingsViewModel: SettingsViewModel
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var childrenListViewModel: ChildrenListViewModel
    
}

#Preview {
    NavigatorView()
        .environmentObject(SettingsViewModel())
        .environmentObject(AuthViewModel())
        .environmentObject(ChildrenListViewModel())
}
