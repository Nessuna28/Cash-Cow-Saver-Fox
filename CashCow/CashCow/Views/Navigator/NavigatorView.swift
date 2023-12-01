//
//  NavigatorView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct NavigatorView: View {
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(Tab.allCases) { tab in
                tab.view
                    .environmentObject(settingsViewModel)
//                    .foregroundColor(settingsViewModel.settings.textColor)
//                    .background(settingsViewModel.settings.backgroundColor)
                    .font(.system(size: settingsViewModel.fontSize))
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
    
    // MARK: - Variables
    
    @State var selectedTab: Tab = .home
    
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
}

#Preview {
    NavigatorView()
        .environmentObject(SettingsViewModel())
}
