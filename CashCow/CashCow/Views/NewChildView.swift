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
            ScrollView {
                ProfileImage()
                
                FamilyMemberPicker(familyMember: $familiyMember)
                    .padding(.bottom, 30)
                
                VStack(spacing: 20) {
                    
                    
                    DisplayForInputFields(title: Strings.lastName, input: $lastName)
                    
                    DisplayForInputFields(title: Strings.firstName, input: $firstName)
                    
                    DatePicker(Strings.birthday, selection: $birthday, displayedComponents: .date)
                    
                    Divider()
                        .padding(.bottom, 40)
                    
                    DisplayForInputFields(title: Strings.loginName, input: $loginName)
                    
                    ImagePicker(loginImage: $loginImage)
                    
                    Divider()
                }
            }
            
            ButtonsForProfile(action: createChild)
        }
        .navigationTitle(Strings.newChildAccount)
        .padding(.horizontal)
    }
    
    // MARK: - Variables
    
    @EnvironmentObject var childProfileViewModel: ChildProfileViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    @State private var authManager = AuthManager.shared
    
    @State private var familiyMember = ""
    @State private var lastName = ""
    @State private var firstName = ""
    @State private var birthday = Date()
    
    @State private var loginName = ""
    @State private var loginImage = ""
    
    
    
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
        
        setData()
        
        childProfileViewModel.createChild()
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
