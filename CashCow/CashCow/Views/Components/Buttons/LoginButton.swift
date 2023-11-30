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
    @State private var isActive = false
    
    var body: some View {
        HStack {
            Spacer()
            
            NavigationLink {
                LoginView()
            } label: {
                Button(action: setModeOnLogin) {
                    TextButtonView(title: Strings.login)
                        .padding(.bottom, 10)
                        .padding(.trailing, 10)
                        .foregroundColor(Colors.primaryGreen)
                }
            }
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
