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
    
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var editViewModel = EditViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationBar()
                    .environmentObject(profileViewModel)
                    .environmentObject(editViewModel)
                    .environmentObject(authViewModel)
                
                NavigatorView()
                    .environmentObject(selectedTab)
                
                Text(Strings.SetUpFinances)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
                    .padding(.top, 10)
                
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
        .environmentObject(AuthViewModel())
}
