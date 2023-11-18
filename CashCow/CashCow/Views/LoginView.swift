//
//  LoginView.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Variables
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var mode: AuthenticationMode
    
    
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
                
                AuthenticationView(mode: mode)
                    .environmentObject(userViewModel)
            }
        }
    }
    
}

#Preview {
    LoginView(mode: .register)
        .environmentObject(UserViewModel(repository: FirebaseRepository()))
}
