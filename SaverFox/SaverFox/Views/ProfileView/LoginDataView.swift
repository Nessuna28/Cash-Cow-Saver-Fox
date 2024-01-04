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
                        Text("nicht verfügbar")
                            .font(.footnote)
                            .foregroundStyle(.red)
                    } else {
                        Text("verfügbar")
                            .font(.footnote)
                            .foregroundStyle(.green)
                    }
                }
                .onChange(of: profileViewModel.selectedLoginName) {
                    profileViewModel.checkLoginName(name: profileViewModel.selectedLoginName)
                }
                
                Button("Speichern") {
                    profileViewModel.toggleUpdateLoginName()
                }
            }
        } else {
            Button(action: profileViewModel.toggleUpdateLoginName) {
                InputField(title: "Anmeldename", input: profileViewModel.child?.loginName ?? Strings.guest)
            }
        }
        
        if profileViewModel.updateLoginImage {
            VStack {
                LoginImagePicker(loginImage: $profileViewModel.selectedLoginImageAsRawValue)
                
                Button("Speichern") {
                    profileViewModel.getTitle(forLoginImage: profileViewModel.selectedLoginImageAsRawValue)
                    profileViewModel.toggleUpdateLoginImage()
                }
            }
        } else {
            Button(action: profileViewModel.toggleUpdateLoginImage) {
                HStack {
                    Text("Anmeldebild")
                    
                    Spacer()
                    
                    profileViewModel.loginImage?
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
