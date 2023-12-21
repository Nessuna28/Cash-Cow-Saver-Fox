//
//  TabbarView.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import SwiftUI

struct TabbarView: View {
    
    var body: some View {
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
                    .foregroundStyle(tabbarViewModel.selectedTab == item ? Colors.textColor : .black.opacity(0.4))
                }
            }
        }
        .frame(height: tabbarViewModel.tabbarSize)
        .padding(.horizontal)
        .background(Colors.secondaryOrange)
        .clipShape(Capsule())
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var tabbarViewModel: TabbarViewModel
    
}

#Preview {
    TabbarView()
        .environmentObject(TabbarViewModel())
}
