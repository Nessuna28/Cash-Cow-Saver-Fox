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
                
                AuthenticationView()
                    .environmentObject(authViewModel)
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
