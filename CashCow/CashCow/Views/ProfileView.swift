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
            Form {
                Section(Strings.profilePicture) {
                    ProfileImage()
                }
                
                Section(Strings.personal) {
                    DisplayForInputFields(title: Strings.lastName, input: $lastName)
                    
                    DisplayForInputFields(title: Strings.firstName, input: $firstName)
                    
                    DatePicker(Strings.birthday, selection: $birthday, displayedComponents: .date)
                    
                    DisplayForInputFields(title: Strings.domicile, input: $domicile)
                    
                    NumberPickerView(children: $children)
                }
                
                
                Section {
                    Button(Strings.save) {
                        updateProfile()
                        dismiss()
                    }
                }
                
                Section {
                    Button(Strings.deleteAccount, role: .destructive) {
                        profileViewModel.deleteUser()
                        dismiss()
                    }
                }
                
                Section {
                    HStack {
                        Text(Strings.childrenAccounts)
                        
                        Spacer()
                        
                        if childrenListViewModel.children.isEmpty {
                            NavigationLink {
                                NewChildView()
                                    .environmentObject(profileViewModel)
                                    .environmentObject(childProfileViewModel)
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
                            .multilineTextAlignment(.trailing)
                    }
                }
                .onAppear {
                    childrenListViewModel.fetchChildren()
                }
                
            }
                
               
            
                    
                .padding(.horizontal)
        }
        .navigationTitle(Strings.profile)
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var childProfileViewModel: ChildProfileViewModel
    @EnvironmentObject var childrenListViewModel: ChildrenListViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State private var authManager = AuthManager.shared
    
    let id: String
    @State private var lastName: String
    @State private var firstName: String
    @State private var birthday: Date
    @State private var domicile: String
    @State private var children: Int
    
    @State private var childLoginName = ""
    
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
        .environmentObject(ChildProfileViewModel())
        .environmentObject(ChildrenListViewModel())
}
