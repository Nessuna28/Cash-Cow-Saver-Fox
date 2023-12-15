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
                    
                    TextField("", text: $childProfileViewModel.selectedtLoginName)
                }
                
                Divider()
                
                HStack {
                    Text(Strings.loginImage)
                    
                    TextField("", text: $childProfileViewModel.selectedtLoginImage)
                }
                
                Divider()
                
                ImageList(loginImage: $childProfileViewModel.selectedtLoginImage)
                    .frame(width: 250)
                    .padding(5)
                    .border(Color.black, width: 1)
                
                Button {
                    
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
        childProfileViewModel.selectedtLoginName.isEmpty || childProfileViewModel.selectedtLoginImage.isEmpty
    }
    
    
    // MARK: - Variables
    
    @StateObject private var childProfileViewModel = AuthViewModel()
    
    
}

#Preview {
    LoginView()
}
