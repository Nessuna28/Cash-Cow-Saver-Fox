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
                LoginView(authenticationMode: .login)
            } label: {
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

#Preview {
    LoginButton()
        .environmentObject(AuthViewModel())
}
