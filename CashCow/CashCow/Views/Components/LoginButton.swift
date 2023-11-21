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
    
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: setModeOnLogin) {
                TextButtonView(title: Strings.login)
                    .padding(.bottom, 20)
                    .padding(.trailing, 20)
                    .foregroundColor(Colors.primaryColor)
            }
        }
    }
    
    // MARK: - Functions
    
    private func setModeOnLogin() {
        
        authViewModel.authenticationMode = .login
    }
    
}

#Preview {
    LoginButton()
}
