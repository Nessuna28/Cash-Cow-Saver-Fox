//
//  TabBarButton.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct TabBarButton: View {
    
    var body: some View {
        Button {
            selectedTab = tab
        } label: {
            VStack {
                tab.icon
                Text(tab.title)
                    .font(.caption)
            }
            .padding(5)
            .padding(.horizontal)
            .foregroundColor(Colors.textColor)
            .background(tab == selectedTab ? Colors.primaryOrange : .white)
            .cornerRadius(30)
            .frame(maxWidth: 100)
        }
    }
    
    
    // MARK: - Variables
    
    let tab: Tab
    
    @Binding var selectedTab: Tab
    
}

#Preview {
    TabBarButton(tab: .overview, selectedTab: .constant(.overview))
}
