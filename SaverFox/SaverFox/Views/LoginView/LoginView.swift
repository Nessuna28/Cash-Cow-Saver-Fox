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
                    Text(Strings.loginName)
                    
                    TextField("", text: $authViewModel.selectedtLoginName)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
                
                Divider()
                
                HStack {
                    Text(Strings.loginImage)
                    
                    TextField("", text: $authViewModel.selectedtLoginImage)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
                
                Divider()
                
                ImageList(loginImage: $authViewModel.selectedtLoginImage)
                    .frame(width: 250)
                    .padding(5)
                    .border(Color.black, width: 1)
                
                if !authViewModel.incorrectData.isEmpty {
                    Text(authViewModel.incorrectData)
                        .foregroundStyle(Colors.primaryOrange)
                        .bold()
                }
                
                Button {
                    logInChild()
                } label: {
                    Text(Strings.letsGo)
                        .foregroundStyle(Colors.textColor)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Colors.primaryOrange)
                        .cornerRadius(20)
                        .padding(30)
                }
                .disabled(disableAuthentication)
            }
        }
    }
    
    
    // MARK: - Computed Properties
    
    private var disableAuthentication: Bool {
        authViewModel.selectedtLoginName.isEmpty || authViewModel.selectedtLoginImage.isEmpty
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    
    
    
    // MARK: - Functions
    
    private func logInChild() {
        
        authViewModel.fetchChild()
        authViewModel.checkLoginData()
        
        if !authViewModel.incorrectData.isEmpty {
            profileViewModel.child = authViewModel.currentChild
            
            profileViewModel.downloadPhoto()
        }
    }
    
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
        .environmentObject(ProfileViewModel())
}
