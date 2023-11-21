//
//  OverviewView.swift
//  CashCow
//
//  Created by Angelique Freier on 19.11.23.
//

import SwiftUI

struct OverviewView: View {
    
    // MARK: - Variables
    
    @StateObject var authViewModel = AuthViewModel()
    
    @EnvironmentObject var selectedTab: TabViewModel
    
    var body: some View {
        VStack {
            NavigationBar()
                .environmentObject(authViewModel)
            
            NavigatorView()
                .environmentObject(selectedTab)
            
            
        }
    }
    
}

#Preview {
    OverviewView()
        .environmentObject(AuthViewModel())
        .environmentObject(TabViewModel())
}
