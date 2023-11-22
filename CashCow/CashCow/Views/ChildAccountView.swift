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
    
    @Binding var childrenAccounts: [FireChild]
        
    @State private var familiyMember = ""
    @State private var lastName = ""
    @State private var firstName = ""
    @State private var birthday = Date()
    
    @State private var loginName = ""
    @State private var loginImage = ""
    
    
    // MARK: - Functions
    
    private func createChild() {
        
        childrenAccounts.append(FireChild(childId: AuthManager.shared.auth.currentUser?.uid ?? "", familyMember: familiyMember, lastName: lastName, firstName: firstName, birthday: birthday, loginName: loginName, loginImage: loginImage))
    }
    
}

#Preview {
    ChildAccountView(childrenAccounts: .constant([]))
}
