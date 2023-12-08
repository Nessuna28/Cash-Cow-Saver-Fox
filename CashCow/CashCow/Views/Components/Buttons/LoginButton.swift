//
//  LoginButton.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct LoginButton: View {
    
    var body: some View {
        HStack {
            Spacer()
            
            NavigationLink {
                LoginView()
            } label: {
                Button(action: setModeOnLogin) {
                    Text(Strings.login)
                        .font(.headline)
                        .bold()
                        .padding(.bottom, 10)
                        .padding(.trailing, 10)
                        .foregroundColor(Colors.primaryGreen)
                }
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    @State private var isActive = false
    
    
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
