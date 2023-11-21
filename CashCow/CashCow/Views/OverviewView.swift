//
//  OverviewView.swift
//  CashCow
//
//  Created by Angelique Freier on 19.11.23.
//

import SwiftUI

struct OverviewView: View {
    
    // MARK: - Variables
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var selectedTab: TabViewModel
    @StateObject var profileViewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationBar()
                    .environmentObject(authViewModel)
                    .environmentObject(profileViewModel)
                
                NavigatorView()
                    .environmentObject(selectedTab)
            }
        }
    }
    
}

#Preview {
    OverviewView()
        .environmentObject(AuthViewModel())
        .environmentObject(TabViewModel())
}
