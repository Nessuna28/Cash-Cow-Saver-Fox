//
//  NewChildView.swift
//  CashCow
//
//  Created by Angelique Freier on 23.11.23.
//

import SwiftUI

struct NewChildView: View {
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Profilbild") {
                    ProfileImage()
                }
                
                Section("persönliches") {
                    FamilyMemberPicker(familyMember: $familiyMember)
                        .padding(.bottom, 30)
                    
                    DisplayForInputFields(title: Strings.lastName, input: $lastName)
                    
                    DisplayForInputFields(title: Strings.firstName, input: $firstName)
                    
                    DatePicker(Strings.birthday, selection: $birthday, displayedComponents: .date)
                }
                
                Section("Anmeldedaten") {
                    
                    VStack {
                        DisplayForInputFields(title: Strings.loginName, input: $loginName)
                        
                        HStack {
                            Spacer()
                            
                            if childProfileViewModel.loginNameExists {
                                Text("nicht verfügbar")
                                    .font(.footnote)
                                    .foregroundStyle(.red)
                            } else {
                                Text("verfügbar")
                                    .font(.footnote)
                                    .foregroundStyle(Colors.primaryGreen)
                            }
                        }
                    }
                    
                    ImagePicker(loginImage: $loginImage)
                }
                .onChange(of: loginName) {
                    childProfileViewModel.checkLoginName(name: loginName)
                }
                
                Section {
                    Button(Strings.save) {
                        createChild()
                    }
                }
                .alert("Name vergeben", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
        }
        .navigationTitle(Strings.newChildAccount)
    }
    
    // MARK: - Variables
    
    @EnvironmentObject var childProfileViewModel: ChildProfileViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State private var authManager = AuthManager.shared
    
    @State private var familiyMember = ""
    @State private var lastName = ""
    @State private var firstName = ""
    @State private var birthday = Date()
    
    @State private var loginName = ""
    @State private var loginImage = ""
    
    @State private var showAlert = false
    
    
    
    
    // MARK: - Functions
    
    private func setData() {
        
        childProfileViewModel.familyMember = familiyMember
        childProfileViewModel.lastName = lastName
        childProfileViewModel.firstName = firstName
        childProfileViewModel.birthday = birthday
        childProfileViewModel.loginName = loginName
        childProfileViewModel.loginImage = loginImage
    }
    
    
    private func createChild() {
        
        if childProfileViewModel.loginNameExists {
            showAlert.toggle()
        } else {
            setData()
            
            childProfileViewModel.createChild()
            
            dismiss()
        }
    }
    
    private func formatDate(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
}


#Preview {
    NewChildView()
        .environmentObject(ChildProfileViewModel())
        .environmentObject(ProfileViewModel())
}
