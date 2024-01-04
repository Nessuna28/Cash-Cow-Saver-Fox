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
                
                InputField(title: "Geburtstag", input: formatDate(date: profileViewModel.child?.birthday ?? Date()))
            }
            
            Section("Logindaten") {
                LoginDataView()
                    .environmentObject(profileViewModel)
            }
            
            Section {
                Button {
                    profileViewModel.updateLoginData()
                    profileViewModel.toggleShowAlert()
                } label: {
                    Text("Speichern")
                        .foregroundStyle(Colors.primaryOrange)
                }
            }
        }
        .alert(isPresented: $profileViewModel.showAlert) {
            Alert(title: Text("Gespeichert"),
                  message: Text("Deine Daten wurden erfolgreich gespeichert"),
                  dismissButton: .default(Text("Okay"))
            )
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    
    
    
    // MARK: - Functions
    
    private func formatDate(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
}

#Preview {
    ProfileView()
        .environmentObject(ProfileViewModel())
}
