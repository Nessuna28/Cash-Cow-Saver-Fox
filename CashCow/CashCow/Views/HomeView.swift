//
//  HomeView.swift
//  CashCow
//
//  Created by Angelique Freier on 28.11.23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationBar()
                    .environmentObject(profileViewModel)
                    .environmentObject(editViewModel)
                    .environmentObject(authViewModel)
                    .environmentObject(childrenListViewModel)
                
                NavigatorView()
                    .environmentObject(tabViewModel)
                
                Text(Strings.SetUpFinances)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
                    .padding(.top, 10)
                
                OverviewView()
            }
            .fullScreenCover(isPresented: $editViewModel.showProcessingSheet) {
                if editViewModel.showProcessingSheet {
                    HStack {
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            EditView(isShowSheet: $editViewModel.showProcessingSheet.animation())
                                .environmentObject(settingsViewModel)
                            
                            Spacer()
                        }
                    }
                }
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject var tabViewModel: TabViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject var childrenListViewModel = ChildrenListViewModel()
    @StateObject var editViewModel = EditViewModel()
    @StateObject var settingsViewModel = SettingsViewModel()
    
}

#Preview {
    HomeView()
        .environmentObject(ProfileViewModel())
        .environmentObject(TabViewModel())
        .environmentObject(AuthViewModel())
        .environmentObject(ChildrenListViewModel())
        .environmentObject(SettingsViewModel())
}
