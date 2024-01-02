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
                    TextField(Strings.loginName, text: $profileViewModel.loginName)
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
                .onChange(of: profileViewModel.loginName) {
                    profileViewModel.checkLoginName(name: profileViewModel.loginName)
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
                LoginImagePicker(loginImage: $profileViewModel.selectedLoginImage)
                
                Button("Speichern") {
                    profileViewModel.currentLoginImage = profileViewModel.getImage(forLoginImage: profileViewModel.selectedLoginImage)
                    profileViewModel.getTitle(forLoginImage: profileViewModel.selectedLoginImage)
                    profileViewModel.toggleUpdateLoginImage()
                }
            }
        } else {
            Button(action: profileViewModel.toggleUpdateLoginImage) {
                HStack {
                    Text("Anmeldebild")
                    
                    Spacer()
                    
                    profileViewModel.currentLoginImage?
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
