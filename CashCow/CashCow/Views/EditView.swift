//
//  EditView.swift
//  CashCow
//
//  Created by Angelique Freier on 27.11.23.
//

import SwiftUI

struct EditView: View {
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 20) {
            Button(Strings.leave) {
                withAnimation {
                    isShowSheet.toggle()
                }
            }
            .padding(.bottom, 15)
            
            DisplayForEditFields(icon: Strings.designIcon, title: Strings.design, action: showDesignSheet)
            
            DisplayForEditFields(icon: Strings.notificationIcon, title: Strings.notification, action: showNotificationSheet)
            
            DisplayForEditFields(icon: Strings.categoriesIcon, title: Strings.categories, action: showCategoriesSheet)
            
            DisplayForEditFields(icon: Strings.logoutIcon, title: Strings.logout, action: logout)
                .padding(.top, 20)
        }
        .transition(.move(edge: .trailing))
        .onTapGesture {
            isShowSheet = false
        }
        .background(.white)
    }
    
    // MARK: - Variables
    
    @Binding var isShowSheet: Bool
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var childrenListViewModel: ChildrenListViewModel
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    
    // MARK: - Functions
    
    private func showDesignSheet() {
        
        settingsViewModel.showDesignSettings.toggle()
    }
    
    private func showNotificationSheet() {
       
        settingsViewModel.showNotificationSettings.toggle()
    }
    
    private func showCategoriesSheet() {
        
        settingsViewModel.showCategoriesSettings.toggle()
    }
    
    private func logout() {
        
        authViewModel.logoutUser()
        childrenListViewModel.removeListener()
    }
    
    
    
}

#Preview {
    EditView(isShowSheet: .constant(false))
        .environmentObject(AuthViewModel())
        .environmentObject(ChildrenListViewModel())
        .environmentObject(SettingsViewModel())
}
