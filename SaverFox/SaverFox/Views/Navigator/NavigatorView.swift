//
//  NavigatorView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct NavigatorView: View {
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                ForEach(Tab.allCases) { tab in
                    tab.view
                        .tabItem {
                            TabBarButton(tab: tab, selectedTab: $selectedTab)
                        }
                        .tag(tab)
                        .padding(.vertical, 20)
                }
            }
        }
    }
    
    // MARK: - Variables
    
    @State private var selectedTab: Tab = .overview
    
}

#Preview {
    NavigatorView()
}
