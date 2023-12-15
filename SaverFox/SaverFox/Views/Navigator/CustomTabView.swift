//
//  CustomTabView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct CustomTabView: View {
    
    var body: some View {
        HStack {
            TabBarButton(tab: .overview, selectedTab: $selectedTab)
            
            TabBarButton(tab: .finance, selectedTab: $selectedTab)
            
            TabBarButton(tab: .saving, selectedTab: $selectedTab)
            
            TabBarButton(tab: .rewards, selectedTab: $selectedTab)
            
            TabBarButton(tab: .games, selectedTab: $selectedTab)
        }
        .frame(maxHeight: 60)
        .padding()
    }
    
    
    // MARK: - Variables
    
    @State private var selectedTab: Tab = .overview
    
}

#Preview {
    CustomTabView()
}
