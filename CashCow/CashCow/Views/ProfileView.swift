//
//  ProfileView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct ProfileView: View {
    
    init(fireUser: FireUser) {
        self.id = fireUser.id
        self._lastName = State(initialValue: fireUser.lastName ?? "")
        self._firstName = State(initialValue: fireUser.firstName)
        self._birthday = State(initialValue: fireUser.birthday ?? Date())
        self._domicile = State(initialValue: fireUser.domicile ?? "")
        self._children = State(initialValue: fireUser.children ?? 0)
    }
    
    
    var body: some View {
        NavigationStack {
            List {
                Section(Strings.profilePicture) {
                    ProfileImage(profileImage: $profileViewModel.profileImage, selectedProfileImage: $profileViewModel.selectedImage)
                }
                
                Section(Strings.personal) {
                    ViewForInputFields(title: Strings.lastName, input: $lastName)
                    
                    ViewForInputFields(title: Strings.firstName, input: $firstName)
                    
                    DatePicker(Strings.birthday, selection: $birthday, displayedComponents: .date)
                    
                    ViewForInputFields(title: Strings.domicile, input: $domicile)
                    
                    NumberPickerView(children: $children)
                }
                
                Section(Strings.family) {
                    HStack {
                        Text(Strings.childrenAccounts)
                        
                        Spacer()
                        
                        if childrenListViewModel.children.isEmpty {
                            Button {
                                childProfileViewModel.showSheetNewChild.toggle()
                            } label: {
                                Image(systemName: Strings.plusIcon)
                                    .foregroundColor(.blue)
                            }
                        } else {
                            Button {
                                showChildrenList.toggle()
                            } label: {
                                Image(systemName: showChildrenList ? Strings.arrowUp : Strings.arrowDown)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    
                    if showChildrenList {
                        ChildrenListView()
                            .environmentObject(childrenListViewModel)
                            .environmentObject(childProfileViewModel)
                    }
                }
                
                Section {
                    Button(Strings.save) {
                        updateProfile()
                        dismiss()
                    }
                }
                
                Section {
                    Button(Strings.deleteProfile, role: .destructive) {
                        profileViewModel.deleteUser()
                        dismiss()
                    }
                }
                .sheet(isPresented: $childProfileViewModel.showSheetNewChild, onDismiss: {
                    guard let id = profileViewModel.fireUser?.id else { return }
                    
                    profileViewModel.downloadPhoto(id: id)
                    childrenListViewModel.fetchChildren()
                    childrenListViewModel.downloadPictures()
                }, content: {
                    ChildAccountView()
                        .environmentObject(childProfileViewModel)
                })
                .onAppear {
                    guard let id = profileViewModel.fireUser?.id else { return }
                    
                    profileViewModel.downloadPhoto(id: id)
                    childrenListViewModel.fetchChildren()
                    childrenListViewModel.downloadPictures()
                }
            }
        }
        .navigationTitle(Strings.profile)
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    @EnvironmentObject private var childProfileViewModel: ChildProfileViewModel
    @EnvironmentObject private var childrenListViewModel: ChildrenListViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    let id: String
    @State private var lastName: String
    @State private var firstName: String
    @State private var birthday: Date
    @State private var domicile: String
    @State private var children: Int
    
    @State private var showChildrenList = false
    
    
    // MARK: - Functions
    
    private func formatDate(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    
    private func updateProfile() {
        
        profileViewModel.fireUser?.lastName = lastName
        profileViewModel.fireUser?.firstName = firstName
        profileViewModel.fireUser?.birthday = birthday
        profileViewModel.fireUser?.domicile = domicile
        profileViewModel.fireUser?.children = children
        
        profileViewModel.updateUser()
    }
    
    
}

#Preview {
    ProfileView(fireUser: ProfileViewModel().fireUser ?? FireUser(id: "", email: "", firstName: "", registeredAt: Date()))
        .environmentObject(ProfileViewModel())
        .environmentObject(ChildProfileViewModel())
        .environmentObject(ChildrenListViewModel())
}
