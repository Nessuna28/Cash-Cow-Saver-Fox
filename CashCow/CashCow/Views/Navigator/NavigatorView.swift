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
                    .tabItem {
                        VStack {
                            ZStack {
                                Circle()
                                    .fill(selectedTab == tab ? Color.blue : Color.clear)
                                    .frame(width: 30, height: 30)
                                
                                tab.icon
                            }
                            
                            Text(tab.title)
                        }
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
