//
//  TabViewForNavigationBar.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct TabViewForNavigationBar: View {
    
    // MARK: - Variables
    
    @EnvironmentObject var tabViewModel: TabViewModel
    
    let tab: Tab
    
    
    var body: some View {
        VStack {
            Image(systemName: tab.icon)
                .padding(.bottom, 2)
            
            Text(tab.title)
                .font(.callout)
            
            if tab.id == tabViewModel.selectedTab.id {
                Rectangle()
                    .frame(width: 70, height: 2)
                                        .foregroundColor(Colors.primaryColor)
            }
        }
    }
    
}

#Preview {
    TabViewForNavigationBar(tab: .home)
        .environmentObject(TabViewModel())
}
