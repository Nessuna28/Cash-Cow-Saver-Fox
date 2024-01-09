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
            Section(Strings.profilePicture) {
                ProfileImage(profileImage: $profileViewModel.profilePicture, selectedProfileImage: $profileViewModel.selectedImage)
                    .environmentObject(profileViewModel)
            }
            
            Section("\(Strings.personal) \(Strings.dataCannotBeChanged)") {
                InputField(title: Strings.familyMember, input: profileViewModel.child?.familyMember ?? "")
                
                InputField(title: Strings.lastName, input: profileViewModel.child?.lastName ?? "")
                
                InputField(title: Strings.firstName, input: profileViewModel.child?.firstName ?? "")
                
                InputField(title: Strings.birthday, input: formatDate(date: profileViewModel.child?.birthday ?? Date()))
            }
            
            Section(Strings.loginData) {
                LoginDataView()
                    .environmentObject(profileViewModel)
            }
            
            Section {
                Button {
                    profileViewModel.uploadPhoto()
                    profileViewModel.updateLoginData()
                    profileViewModel.toggleShowAlert()
                } label: {
                    Text(Strings.save)
                        .foregroundStyle(Colors.primaryOrange)
                }
            }
        }
        .alert(isPresented: $profileViewModel.showAlert) {
            Alert(title: Text(Strings.saved),
                  message: Text(Strings.dataSaved),
                  dismissButton: .default(Text(Strings.okay))
            )
        }
        .navigationTitle(Strings.profile)
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
