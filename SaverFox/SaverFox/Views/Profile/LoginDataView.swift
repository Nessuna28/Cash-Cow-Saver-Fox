//
//  LoginDataView.swift
//  SaverFox
//
//  Created by Angelique Freier on 02.01.24.
//

import SwiftUI

struct LoginDataView: View {
    
    var body: some View {
        if profileViewModel.updateLoginName {
            VStack {
                HStack {
                    TextField(Strings.loginName, text: $profileViewModel.selectedLoginName)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    Spacer()
                    
                    if profileViewModel.loginNameExists {
                        Text(Strings.notAvailable)
                            .font(.footnote)
                            .foregroundStyle(.red)
                    } else {
                        Text(Strings.available)
                            .font(.footnote)
                            .foregroundStyle(.green)
                    }
                }
                .onChange(of: profileViewModel.selectedLoginName) {
                    profileViewModel.checkLoginName(name: profileViewModel.selectedLoginName)
                }
                
                Button(Strings.save) {
                    profileViewModel.toggleUpdateLoginName()
                }
            }
        } else {
            Button(action: profileViewModel.toggleUpdateLoginName) {
                InputField(title: Strings.loginName, input: profileViewModel.selectedLoginName)
            }
        }
        
        if profileViewModel.updateLoginImage {
            VStack {
                LoginImagePicker(loginImage: $profileViewModel.selectedLoginImageAsRawValue)
                
                Button(Strings.save) {
                    profileViewModel.getTitle(forLoginImage: profileViewModel.selectedLoginImageAsRawValue)
                    profileViewModel.toggleUpdateLoginImage()
                }
            }
        } else {
            Button(action: profileViewModel.toggleUpdateLoginImage) {
                HStack {
                    Text(Strings.loginImage)
                    
                    Spacer()
                    
                    profileViewModel.getImage(forLoginImage: profileViewModel.selectedLoginImageAsTitle)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                }
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    
}

#Preview {
    LoginDataView()
        .environmentObject(ProfileViewModel())
}
