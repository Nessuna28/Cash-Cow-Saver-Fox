//
//  ChildAccountView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct ChildAccountView: View {
    
    init(fireChild: FireChild) {
        self._familiyMember = State(initialValue: fireChild.familyMember)
        self._lastName = State(initialValue: fireChild.lastName ?? "")
        self._firstName = State(initialValue: fireChild.firstName)
        self._birthday = State(initialValue: fireChild.birthday ?? Date())
        self._loginName = State(initialValue: fireChild.loginName)
        self._loginImage = State(initialValue: fireChild.loginImage)
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileImage()
                
                VStack(spacing: 20) {
                    DisplayForInputFields(title: "Nachname", input: $lastName)
                    
                    DisplayForInputFields(title: "Vorname", input: $firstName)
                    
                    DatePicker("Geburtstag", selection: $birthday, displayedComponents: .date)
                    
                    Divider()
                        .padding(.bottom, 40)
                    
                    DisplayForInputFields(title: "Anmeldename", input: $loginName)
                    
                    ImagePicker(loginImage: $loginImage)
                    
                    Divider()
                }
            }
            
            ButtonsForProfile(action: createChild)
        }
        .navigationTitle("Kinderaccount")
        .padding(.horizontal)
    }
    
    // MARK: - Variables
    
    @StateObject var childAuthViewModel = ChildAuthViewModel()
    @StateObject var childProfileViewModel = ChildProfileViewModel()
    @EnvironmentObject var profileViewModel: ProfileViewModel
        
    @State private var familiyMember = ""
    @State private var lastName = ""
    @State private var firstName = ""
    @State private var birthday = Date()
    
    @State private var loginName = ""
    @State private var loginImage = ""
    
    
    // MARK: - Functions
    
    private func createChild() {
        
        if let existingChild = profileViewModel.fireUser?.childrenAccounts?.first(where: { $0.firstName == firstName }) {
            childProfileViewModel.updateChild(loginName: existingChild.loginName)
            } else {
                childAuthViewModel.registerChild(loginName: loginName, loginImage: loginImage)
                if let child = childProfileViewModel.fireChild {
                    profileViewModel.fireUser?.childrenAccounts?.append(child)
                }
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
    ChildAccountView(fireChild: FireChild(parentsId: "", familyMember: "", firstName: "", loginName: "", loginImage: "", registeredAt: Date()))
        .environmentObject(ProfileViewModel())
}
