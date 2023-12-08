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
                Section(Strings.profilePicture) {
                    //ProfileImage()
                }
                
                Section(Strings.personal) {
                    FamilyMemberPicker(familyMember: $familiyMember)
                        .padding(.bottom, 30)
                    
                    ViewForInputFields(title: Strings.lastName, input: $lastName)
                    
                    ViewForInputFields(title: Strings.firstName, input: $firstName)
                    
                    DatePicker(Strings.birthday, selection: $birthday, displayedComponents: .date)
                }
                
                Section(Strings.loginDetails) {
                    
                    VStack {
                        ViewForInputFields(title: Strings.loginName, input: $loginName)
                        
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
                .onChange(of: loginName) {
                    childProfileViewModel.checkLoginName(name: loginName)
                }
                
                Section {
                    Button(Strings.save) {
                        createChild()
                    }
                }
                .alert(Strings.assignName, isPresented: $showAlert) {
                    Button(Strings.okay, role: .cancel) { }
                }
            }
        }
        .navigationTitle(Strings.newChildAccount)
    }
    
    // MARK: - Variables
    
    @EnvironmentObject private var childProfileViewModel: ChildProfileViewModel
    
    @Environment(\.dismiss) private var dismiss
    
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
}
