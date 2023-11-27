//
//  EditView.swift
//  CashCow
//
//  Created by Angelique Freier on 27.11.23.
//

import SwiftUI

struct EditView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                
                Button(Strings.leave) {
                    withAnimation {
                        isShowSheet.toggle()
                    }
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
    
    
    // MARK: - Functions
    
    private func showDesignSheet() {
        
    }
    
    private func showNotificationSheet() {
        
    }
    
    private func showCategoriesSheet() {
        
    }
    
    private func logout() {
        
        authViewModel.logoutUser()
    }
    
    
    
}

#Preview {
    EditView(isShowSheet: .constant(false))
        .environmentObject(AuthViewModel())
}
