//
//  OverviewView.swift
//  CashCow
//
//  Created by Angelique Freier on 19.11.23.
//

import SwiftUI

struct OverviewView: View {
    
    // MARK: - Variables
    
    @EnvironmentObject var selectedTab: TabViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationBar()
                    .environmentObject(profileViewModel)
                
                NavigatorView()
                    .environmentObject(selectedTab)
                
                ScrollView {
                    ForEach(Tab.allCases) { tab in
                        TabListForOverview(tab: tab)
                    }
                    .padding(.top,50)
                }
                .padding(.horizontal)
            }
        }
    }
    
}

#Preview {
    OverviewView()
        .environmentObject(ProfileViewModel())
        .environmentObject(TabViewModel())
}
