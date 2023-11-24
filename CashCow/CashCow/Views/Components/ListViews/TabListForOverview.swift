//
//  TabListForOverview.swift
//  CashCow
//
//  Created by Angelique Freier on 24.11.23.
//

import SwiftUI

struct TabListForOverview: View {
    
    var body: some View {
        HStack {
            Image(systemName: tab.icon)
            
            Text(tab.title)
            
            Spacer()
            
            Image(systemName: Strings.plusIcon)
        }
        .padding(.bottom, 20)
    }
    
    // MARK: - Variables
    
    let tab: Tab
    
}

#Preview {
    TabListForOverview(tab: .home)
}
