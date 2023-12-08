//
//  ChildAccountView.swift
//  CashCow
//
//  Created by Angelique Freier on 21.11.23.
//

import SwiftUI

struct ChildAccountView: View {
    
    init?(child: FireChild?) {
        self.child = child

        self._familiyMember = State(initialValue: child?.familyMember ?? "")
        self._lastName = State(initialValue: child?.lastName ?? "")
        self._firstName = State(initialValue: child?.firstName ?? "")
        self._birthday = State(initialValue: child?.birthday ?? Date())
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(Strings.profilePicture) {
                    //ProfileImage()
                }
                
                
                Section(Strings.personal) {
                    ViewForInputFields(title: Strings.lastName, input: $lastName)
                    
                    ViewForInputFields(title: Strings.firstName, input: $firstName)
                    
                    DatePicker(Strings.birthday, selection: $birthday, displayedComponents: .date)
                }
                
                Section {
                    Button(Strings.save) {
                        childProfileViewModel.updateChild(id: child?.id ?? "")
                        dismiss()
                    }
                }
                
                Section {
                    Button(Strings.deleteProfile, role: .destructive) {
                        childProfileViewModel.deleteChild(id: child?.id ?? "")
                        dismiss()
                    }
                }
            }
        }
        .navigationTitle(Strings.childrenAccounts)
        .padding(.horizontal)
    }
    
    // MARK: - Variables
    
    @EnvironmentObject private var childProfileViewModel: ChildProfileViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var authManager = AuthManager.shared
    
    @State private var child: FireChild?
    
    @State private var familiyMember = ""
    @State private var lastName = ""
    @State private var firstName = ""
    @State private var birthday = Date()
    
    
    
    // MARK: - Functions
    
    private func setData() {
        
        childProfileViewModel.familyMember = familiyMember
        childProfileViewModel.lastName = lastName
        childProfileViewModel.firstName = firstName
        childProfileViewModel.birthday = birthday
    }
    
    
    private func createChild() {
        
        setData()
        
        guard let id = child?.id else { return }
        childProfileViewModel.updateChild(id: id)
    }
    
    private func formatDate(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
}

#Preview {
    ChildAccountView(child: FireChild(parentId: "", familyMember: "", firstName: "", loginName: "", loginImage: "", registeredAt: Date()))
        .environmentObject(ChildProfileViewModel())
}
