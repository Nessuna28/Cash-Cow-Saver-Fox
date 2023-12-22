//
//  ChildAccountView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct ChildAccountView: View {
    
    var body: some View {
        NavigationStack {
            List {
                Section(Strings.profilePicture) {
                    ProfileImage(profileImage: $childProfileViewModel.profileImage, selectedProfileImage: $childProfileViewModel.selectedImage)
                }
                
                Section(Strings.personal) {
                    FamilyMemberPicker(familyMember: $childProfileViewModel.familyMember)
                    
                    ViewForInputFields(title: Strings.lastName, input: $childProfileViewModel.lastName)
                    
                    ViewForInputFields(title: Strings.firstName, input: $childProfileViewModel.firstName)
                    
                    DatePicker(Strings.birthday, selection: $childProfileViewModel.birthday, displayedComponents: .date)
                }
                
                if childProfileViewModel.currentChildId.isEmpty {
                    Section(Strings.loginDetails) {
                        VStack {
                            ViewForInputFields(title: Strings.loginName, input: $childProfileViewModel.loginName)
                            
                            HStack {
                                Spacer()
                                
                                if childProfileViewModel.loginNameExists {
                                    Text(Strings.notAvailable)
                                        .font(.footnote)
                                        .foregroundStyle(.red)
                                } else {
                                    Text(Strings.available)
                                        .font(.footnote)
                                        .foregroundStyle(Colors.primaryGreen)
                                }
                            }
                        }
                        
                        ImagePicker(loginImage: $loginImage)
                    }
                    .onChange(of: childProfileViewModel.loginName) {
                        childProfileViewModel.checkLoginName(name: childProfileViewModel.loginName)
                    }
                }
                
                Section {
                    Button(Strings.save) {
                        if childProfileViewModel.currentChildId.isEmpty {
                            createChild()
                        } else {
                            updateChild()
                        }
                    }
                }
                
                if !childProfileViewModel.currentChildId.isEmpty {
                    Section {
                        Button(Strings.deleteProfile, role: .destructive) {
                            deleteChild(id: childProfileViewModel.fireChild?.id ?? "")
                        }
                    }
                }
            }
            .alert(Strings.assignName, isPresented: $showAlert) {
                Button(Strings.okay, role: .cancel) { }
            }
        }
        .onAppear {
            childProfileViewModel.fetchChild()
        }
        .navigationTitle(Strings.childrenAccounts)
        .padding(.horizontal)
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var childProfileViewModel: ChildProfileViewModel
    
    @State private var showAlert = false
    @State private var loginImage = ""
    
    
    
    // MARK: - Functions
    
    private func createChild() {
        
        if childProfileViewModel.loginNameExists {
            showAlert.toggle()
        } else {
            childProfileViewModel.loginImage = childProfileViewModel.getTitle(forLoginImage: loginImage) ?? ""
            childProfileViewModel.createChild()
            
            childProfileViewModel.closeNewChildSheet()
        }
    }
    
    
    private func updateChild() {
        
        guard let id = childProfileViewModel.fireChild?.id else { return }
        
        childProfileViewModel.updateChild(id: id)
        childProfileViewModel.closeChildAccountSheet()
    }
    
    
    private func deleteChild(id: String) {
        
        childProfileViewModel.deleteChild(id: id)
        childProfileViewModel.closeChildAccountSheet()
    }
    
    
    private func formatDate(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
}

#Preview {
    ChildAccountView()
        .environmentObject(ChildProfileViewModel())
}
