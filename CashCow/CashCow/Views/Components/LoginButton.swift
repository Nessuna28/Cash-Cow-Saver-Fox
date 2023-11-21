//
//  LoginButton.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct LoginButton: View {
    
    // MARK: - Variables
        
        @EnvironmentObject var authViewModel: AuthViewModel
        @State private var isActive: Bool = false
        
        var body: some View {
            HStack {
                Spacer()
                
                NavigationLink(
                    destination: LoginView(),
                    isActive: $isActive,
                    label: {
                        Button(action: setModeOnLogin) {
                            TextButtonView(title: Strings.login)
                                .padding(.bottom, 20)
                                .padding(.trailing, 20)
                                .foregroundColor(Colors.primaryColor)
                        }
                    }
                )
                .isDetailLink(false)
            }
        }
        
    
        // MARK: - Functions
        
        private func setModeOnLogin() {
            authViewModel.authenticationMode = .login
            isActive = true
        }
    
}

#Preview {
    LoginButton()
        .environmentObject(AuthViewModel())
}
