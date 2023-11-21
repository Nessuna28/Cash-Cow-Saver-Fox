//
//  NavigatorView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct NavigatorView: View {
    
    // MARK: - Variables
    
    @EnvironmentObject var tabViewModel: TabViewModel
    
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(Tab.allCases) { tab in
                    TabViewForNavigationBar(tab: tab)
                        .environmentObject(tabViewModel)
                        .onTapGesture {
                            tabViewModel.selectedTab = tab
                        }
                }
                .padding()
                .foregroundColor(Colors.textColorOnS)
            }
        }
        .background(Colors.secondaryColor)
    }
    
    
}

#Preview {
    NavigatorView()
        .environmentObject(TabViewModel())
}
