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
    //                    .foregroundColor(Color(settingsViewModel.textColor))
    //                    .background(Color(settingsViewModel.backgroundColor))
    //                    .font(.system(size: settingsViewModel.fontSize))
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
    
    @State var selectedTab: Tab = .home
    
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var childrenListViewModel: ChildrenListViewModel
    
}

#Preview {
    NavigatorView()
        .environmentObject(SettingsViewModel())
        .environmentObject(AuthViewModel())
        .environmentObject(ChildrenListViewModel())
}
