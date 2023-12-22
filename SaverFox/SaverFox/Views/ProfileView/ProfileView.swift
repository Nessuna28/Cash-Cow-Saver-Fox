//
//  ProfileView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        List {
            Section("Profilbild") {
                ProfileImage(profileImage: $profileViewModel.profilePicture, selectedProfileImage: $profileViewModel.selectedImage)
                    .environmentObject(profileViewModel)
            }
            
            Section("Persönliches \ndiese Daten können nicht geändert werden") {
                InputField(title: "Familienmitglied", input: profileViewModel.child?.familyMember ?? "")
                
                InputField(title: "Nachname", input: profileViewModel.child?.lastName ?? "")
                
                InputField(title: "Vorname", input: profileViewModel.child?.firstName ?? "")
            }
            
            Section("Logindaten") {
                if profileViewModel.updateLoginName {
                    VStack {
                        TextField(Strings.loginName, text: $profileViewModel.loginName)
                        
                        HStack {
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
                        
                        Button("Speichern") {
                            profileViewModel.toggleUpdateLoginName()
                        }
                    }
                } else {
                    Button(action: profileViewModel.toggleUpdateLoginName) {
                        InputField(title: "Anmeldename", input: profileViewModel.loginName)
                    }
                }
                
                if profileViewModel.updateLoginImage {
                    VStack {
                        LoginImagePicker(loginImage: $profileViewModel.selectedLoginImage)
                        
                        Button("Speichern") {
                            profileViewModel.toggleUpdateLoginImage()
                        }
                    }
                } else {
                    HStack {
                        Button(action: profileViewModel.toggleUpdateLoginImage) {
                            Text("Anmeldebild")
                            
                            Spacer()
                            
                            Image("profileViewModel.loginImage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                        }
                    }
                }
            }
            
            Section {
                Button {
                    profileViewModel.updateChild()
                    dismiss()
                } label: {
                    Text("Speicher")
                        .foregroundStyle(Colors.primaryOrange)
                }
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    @Environment(\.dismiss) private var dismiss
    
}

#Preview {
    ProfileView()
        .environmentObject(ProfileViewModel())
}
