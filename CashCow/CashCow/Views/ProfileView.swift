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
        self._childrenAccounts = State(initialValue: fireUser.childrenAccounts ?? [])
    }
    
    // MARK: - Variables
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    let id: String
    @State private var lastName: String
    @State private var firstName: String
    @State private var birthday: Date
    @State private var domicile: String
    @State private var children: Int
    @State private var childrenAccounts: [FireChild]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileImage()
                
                VStack(spacing: 20) {
                    DisplayForInputFields(title: "Nachname", input: $lastName)
                    
                    DisplayForInputFields(title: "Vorname", input: $firstName)
                    
                    DatePicker("Geburtstag", selection: $birthday, displayedComponents: .date)
                    
                    Divider()
                    
                    DisplayForInputFields(title: "Wohnort", input: $domicile)
                    
                    NumberPickerView(children: $children)
                    
                    Divider()
                    
                    HStack {
                        Text("Kinderaccounts")
                        
                        Spacer()
                        
                        if profileViewModel.fireUser?.childrenAccounts?.isEmpty ?? true {
                            NavigationLink {
                                ChildAccountView(childrenAccounts: $childrenAccounts)
                            } label: {
                                Image(systemName: Strings.plusIcon)
                                    .foregroundColor(.blue)
                            }
                        } else {
                            NavigationLink(destination: ChildrenListView().environmentObject(profileViewModel)) {
                                Image(systemName: Strings.arrowRight)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .padding()
            }
            
            Spacer()
            
            ButtonsForProfile(action: profileViewModel.updateUser)
        }
        .navigationTitle("Profil")
        .padding(.horizontal)
    }
    
    // MARK: - Functions
    
    private func formatDate(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
}

#Preview {
    ProfileView(fireUser: ProfileViewModel().fireUser ?? FireUser(id: "", email: "", firstName: "", registeredAt: Date()))
        .environmentObject(ProfileViewModel())
}
