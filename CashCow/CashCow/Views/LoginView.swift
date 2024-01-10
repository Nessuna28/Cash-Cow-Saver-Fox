//
//  LoginView.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct LoginView: View {
   
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(Strings.appIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Text(Strings.welcome)
                    .font(.title)
                    .padding(.bottom, 50)
                
                AuthenticationView(authenticationMode: authenticationMode)
                    .environmentObject(authViewModel)
                    .environmentObject(choiceOptionViewModel)
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var choiceOptionViewModel: ChoiceOptionViewModel
    
    let authenticationMode: AuthenticationMode
    
}

#Preview {
    LoginView(authenticationMode: .login)
        .environmentObject(AuthViewModel())
        .environmentObject(ChoiceOptionViewModel())
}
