//
//  LoginView.swift
//  SaverFox
//
//  Created by Angelique Freier on 06.12.23.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        ZStack {
            Colors.secondaryOrange
                .ignoresSafeArea()
            
            VStack {
                Image(Strings.appTitle)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                Image(Strings.appImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text(Strings.welcome)
                    .font(.title2)
                    .padding(40)
                
                HStack {
                    Text("\(Strings.loginName):")
                    
                    TextField("", text: $authViewModel.selectedLoginName)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
                
                Divider()
                
                HStack {
                    Text("\(Strings.loginImage):")
                    
                    TextField("", text: $authViewModel.selectedLoginImage)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
                
                Divider()
                
                ImageList(loginImage: $authViewModel.selectedLoginImage)
                    .frame(width: 250)
                    .padding(5)
                    .border(Color.black, width: 1)
                
                if !authViewModel.errorMessage.isEmpty {
                    Text(authViewModel.errorMessage)
                        .foregroundStyle(Colors.primaryOrange)
                        .bold()
                }
                
                PrimaryButton(action: logInChild, text: Strings.letsGo)
                .disabled(disableAuthentication)
            }
            .padding(.horizontal)
        }
    }
    
    
    // MARK: - Computed Properties
    
    private var disableAuthentication: Bool {
        authViewModel.selectedLoginName.isEmpty || authViewModel.selectedLoginImage.isEmpty
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    
    
    
    // MARK: - Functions
    
    private func logInChild() {
        
        authViewModel.fetchChild()
        profileViewModel.currentLoginName = authViewModel.selectedLoginName
        profileViewModel.currentLoginImageAsTitle = authViewModel.selectedLoginImage
    }
    
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
        .environmentObject(ProfileViewModel())
}
