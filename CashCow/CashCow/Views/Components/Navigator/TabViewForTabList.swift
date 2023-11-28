//
//  TabView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct TabViewForTabList: View {
    
    let tab: Tab
    
    var body: some View {
        HStack {
            tab.icon
            
            Text(tab.title)
        }
    }
    
}

#Preview {
    TabViewForTabList(tab: .home)
}
