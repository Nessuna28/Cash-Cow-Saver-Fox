//
//  TabViewForNavigationBar.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct TabViewForNavigationBar: View {
    
    // MARK: - Variables
    
    let selectedTab: Tab
    
    
    var body: some View {
        VStack {
            Image(systemName: selectedTab.icon)
            
            Text(selectedTab.title)
        }
    }
    
}

#Preview {
    TabViewForNavigationBar(selectedTab: .home)
}
