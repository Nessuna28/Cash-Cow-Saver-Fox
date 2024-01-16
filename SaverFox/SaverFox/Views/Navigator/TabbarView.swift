//
//  TabbarView.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import SwiftUI

struct TabbarView: View {
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                ForEach(tabbarViewModel.tabs) { item in
                    Button {
                        tabbarViewModel.selectedTab = item
                    } label: {
                        VStack {
                            item.icon
                                .font(.headline)
                                .frame(width: 24, height: 24)
                            
                            Text(item.title)
                                .font(.callout)
                                .frame(maxWidth: .infinity)
                        }
                        .foregroundStyle(tabbarViewModel.selectedTab == item ? Colors.primaryOrange : Colors.secondaryOrange)
                    }
                }
            }
        }
        .frame(height: tabbarViewModel.tabbarSize)
        .padding(.horizontal)
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var tabbarViewModel: TabbarViewModel
    
}

#Preview {
    TabbarView()
        .environmentObject(TabbarViewModel())
}
